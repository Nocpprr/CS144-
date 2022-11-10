#include "byte_stream.hh"

// Dummy implementation of a flow-controlled in-memory byte stream.

// For Lab 0, please replace with a real implementation that passes the
// automated checks run by `make check_lab0`.

// You will need to add private members to the class declaration in `byte_stream.hh`

template <typename... Targs>
void DUMMY_CODE(Targs &&... /* unused */) {}

using namespace std;

ByteStream::ByteStream(const size_t capacity) : _nwrite(0), _nread(0), _ncapacity(capacity), _buf(std::vector<char>(capacity))
{
    DUMMY_CODE(capacity); 
}

size_t ByteStream::write(const string &data) {
    DUMMY_CODE(data);
    size_t len = 0;
    for(const auto &e : data)
    {
        if(_nwrite >= _nread + _ncapacity)
        {
            break;
        }
        _buf[_nwrite % _ncapacity] = e;
        ++_nwrite;
        ++len;
    }
    return len;
}

//! \param[in] len bytes will be copied from the output side of the buffer
string ByteStream::peek_output(const size_t len) const {
    DUMMY_CODE(len);
    string res;
    for(size_t i = _nread; i < (_nread + len) && i < _nwrite; ++i)
    {
        res.push_back(_buf[i % _ncapacity]);
    }    
    return res;
}

//! \param[in] len bytes will be removed from the output side of the buffer
void ByteStream::pop_output(const size_t len) { 
    DUMMY_CODE(len);
    for(size_t i = 0; i < len; ++i)
    {
        if(_nread < _nwrite)
        {
            ++_nread;
        }
        else
        {
            return;
        }
    } 
}

//! Read (i.e., copy and then pop) the next "len" bytes of the stream
//! \param[in] len bytes will be popped and returned
//! \returns a string
std::string ByteStream::read(const size_t len) {
    DUMMY_CODE(len);
    size_t length = len;
    if(length > _nwrite)
    {
        length = _nwrite;
    }
    std::string ans = peek_output(length);
    pop_output(length);
    return ans;
}

void ByteStream::end_input() { input_ended_flag = true; }

bool ByteStream::input_ended() const { return input_ended_flag; }

size_t ByteStream::buffer_size() const { return _nwrite - _nread; }

bool ByteStream::buffer_empty() const { return buffer_size() == 0; }

bool ByteStream::eof() const { return input_ended_flag && buffer_empty(); }

size_t ByteStream::bytes_written() const { return _nwrite; }

size_t ByteStream::bytes_read() const { return _nread; }

size_t ByteStream::remaining_capacity() const { return _ncapacity - (_nwrite - _nread); }
