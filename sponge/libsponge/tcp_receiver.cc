#include "tcp_receiver.hh"

// Dummy implementation of a TCP receiver

// For Lab 2, please replace with a real implementation that passes the
// automated checks run by `make check_lab2`.

template <typename... Targs>
void DUMMY_CODE(Targs &&... /* unused */) {}

using namespace std;

void TCPReceiver::segment_received(const TCPSegment &seg) {
    DUMMY_CODE(seg);    
    // TCP 三次握手中，只有建立连接时SYN == 1
    TCPHeader _header = seg.header();
    
    uint64_t abs_n = 0; // reassembler 的 index
    if(!_is_first)
    {
        if(_header.syn)
        {
            _isn = _header.seqno;
            _is_first = true;
            _reassembler.push_substring(seg.payload().copy(), 0, _header.fin);
        }
        return;
    }
    abs_n = unwrap(_header.seqno, _isn, _reassembler.stream_out().bytes_written());  
    _reassembler.push_substring(seg.payload().copy(), abs_n - 1, _header.fin);
}

optional<WrappingInt32> TCPReceiver::ackno() const {
    if(!_is_first) return nullopt;
    uint64_t _written = _reassembler.stream_out().bytes_written() + 1;
    if(_reassembler.stream_out().input_ended() ) // fin 算一个 byte
    {
        ++_written;
    }
    return wrap(_written, _isn);
}

size_t TCPReceiver::window_size() const { return _capacity - _reassembler.stream_out().buffer_size(); }
