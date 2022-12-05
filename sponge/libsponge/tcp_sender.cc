#include "tcp_sender.hh"

#include "tcp_config.hh"

#include <random>

// Dummy implementation of a TCP sender

// For Lab 3, please replace with a real implementation that passes the
// automated checks run by `make check_lab3`.

template <typename... Targs>
void DUMMY_CODE(Targs &&... /* unused */) {}

using namespace std;

//! \param[in] capacity the capacity of the outgoing byte stream
//! \param[in] retx_timeout the initial amount of time to wait before retransmitting the oldest outstanding segment
//! \param[in] fixed_isn the Initial Sequence Number to use, if set (otherwise uses a random ISN)
TCPSender::TCPSender(const size_t capacity, const uint16_t retx_timeout, const std::optional<WrappingInt32> fixed_isn)
    : _isn(fixed_isn.value_or(WrappingInt32{random_device()()}))
    , _initial_retransmission_timeout{retx_timeout}
    , _retransmission_timeout{retx_timeout}
    , _stream(capacity) {}

uint64_t TCPSender::bytes_in_flight() const { return _next_seqno - _ack_seqno; }

void TCPSender::fill_window() {
    TCPSegment tcp_segment;
    if(_fin) return;

    if(!_syn)
    {
        tcp_segment.header().syn = true;
        _syn = true;
        send_Tcp_segment(tcp_segment);
        return;
    }

    uint16_t window_size = _receiver_window_size == 0 ? 1  : _receiver_window_size;

    if(_stream.eof() && _next_seqno < _ack_seqno + window_size) 
    {
        tcp_segment.header().fin = true;
        send_Tcp_segment(tcp_segment);
        _fin = true;
        return;
    }
    // 注意判断条件，下一次要发送的数据不能超过接收方窗口大小
    while(!_stream.buffer_empty() && _next_seqno < _ack_seqno + window_size)
    {
        size_t Maxlen = min(TCPConfig::MAX_PAYLOAD_SIZE, window_size + _ack_seqno - _next_seqno);
        tcp_segment.payload() = _stream.read(Maxlen);
        if(_stream.eof() && tcp_segment.length_in_sequence_space() < window_size)
        {
            tcp_segment.header().fin = true;
            _fin = true;
        }
        send_Tcp_segment(tcp_segment);
    }

    
}

//实现一个发送tcp_segment的函数
void TCPSender::send_Tcp_segment(TCPSegment &tcp_segment)
{
    tcp_segment.header().seqno = wrap(_next_seqno, _isn);
    _next_seqno += tcp_segment.length_in_sequence_space();
    _segments_ack.push(tcp_segment);
    _segments_out.push(tcp_segment);

    if(!_is_retransmission_time_run)
    {
        _is_retransmission_time_run = true;
        _retransmission_timeout = _initial_retransmission_timeout;
        _retransmission_timer = 0;
    }
   
}

//! \param ackno The remote receiver's ackno (acknowledgment number)
//! \param window_size The remote receiver's advertised window size
void TCPSender::ack_received(const WrappingInt32 ackno, const uint16_t window_size) {
    uint64_t _abs_ackno = unwrap(ackno, _isn, _next_seqno);
    //接受方需求的序列号超出下一个要发送的段的序列号
    if(_abs_ackno > _next_seqno) return;

    //更新窗口
    if(_abs_ackno >= _ack_seqno)
    {
        _ack_seqno = _abs_ackno;
        _receiver_window_size = window_size;
        if(window_size == 0) _zero_window = true;
    }
    //删除已被确认的tcp段
    //一个细节：若删除后发送窗口有空闲，则继续尝试发送
    bool flag = false;
    while(!_segments_ack.empty())
    {
        TCPSegment tmp = _segments_ack.front();
        //注意：若接收方需求的下一个序列号大于最早待确认的tcp段的序列号+长度，则表示此tcp段已接受
        uint64_t _seqn = unwrap(tmp.header().seqno, _isn, _next_seqno) + tmp.length_in_sequence_space();
        if(_seqn <= _abs_ackno)
        {
            flag = true;
            _segments_ack.pop();
            _is_retransmission_time_run = true;
            _retransmission_timeout = _initial_retransmission_timeout;
            _consecutive_retransmissions = 0;
            _retransmission_timer = 0;
        }
        else break;
    }
    
    if(flag) fill_window();

    //根据_segments_ack是否为空来判断重传计时器是否开启
    if(!_segments_ack.empty())
    {
        _is_retransmission_time_run = true;
    }// 一定要注意关闭重传计时器。。。
    else _is_retransmission_time_run = false;
 }

//! \param[in] ms_since_last_tick the number of milliseconds since the last call to this method
void TCPSender::tick(const size_t ms_since_last_tick) { 
    if(!_is_retransmission_time_run) return;
    
    _retransmission_timer += ms_since_last_tick;
    if(_retransmission_timer >= _retransmission_timeout)
    {
        TCPSegment tmp = _segments_ack.front();
        _segments_out.push(tmp);
        _retransmission_timer = 0;
        //根据RFC6298第五条规则
        //根据Lab3 test #17 修改，若传来的window_size为 0, 不进行RTO翻倍
        //When filling window, treat a '0' window size as equal to '1' but don't back off RTO
        if(!_zero_window) _retransmission_timeout *= 2;
        ++_consecutive_retransmissions;
    }

 }

unsigned int TCPSender::consecutive_retransmissions() const { return _consecutive_retransmissions; }

void TCPSender::send_empty_segment() {
    TCPSegment tcp_segment;
    tcp_segment.header().seqno = wrap(_next_seqno, _isn);
    _segments_out.push(tcp_segment);
}
