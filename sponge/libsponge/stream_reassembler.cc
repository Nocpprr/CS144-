#include "stream_reassembler.hh"

// Dummy implementation of a stream reassembler.

// For Lab 1, please replace with a real implementation that passes the
// automated checks run by `make check_lab1`.

// You will need to add private members to the class declaration in `stream_reassembler.hh`

template <typename... Targs>
void DUMMY_CODE(Targs &&... /* unused */) {}

using namespace std;

StreamReassembler::StreamReassembler(const size_t capacity) : 
    _output(capacity), _capacity(capacity), _unassembled_bytes(0), 
    _datas(capacity, '\0'), _is_write(), _next_index(0), _eof(false), _eof_index(0) {}

//! \details This function accepts a substring (aka a segment) of bytes,
//! possibly out-of-order, from the logical stream, and assembles any newly
//! contiguous substrings and writes them into the output stream in order.
void StreamReassembler::push_substring(const string &data, const size_t index, const bool eof) {

    if(index >= _next_index + _output.remaining_capacity())
    {
        return;
    }


    if(eof && index + data.size() <= _next_index + _output.remaining_capacity())
    {
        _eof = true;
        _eof_index = index + data.size();
    }

    if(index + data.size() > _next_index)
    {
        for(size_t i = (index > _next_index ? index : _next_index); i < _next_index + _output.remaining_capacity()
        && i < index + data.size(); ++i)
        {
            if(_is_write.count(i) == 0)
            {
                // 扩容 _datas
                if(_datas.capacity() <= i)
                {
                    _datas.reserve(i * 2);
                }
                _datas[i] = data[i - index];
                _is_write.insert(i);
                ++_unassembled_bytes;
            }
        }
        std::string _writes;
        while(_is_write.count(_next_index) > 0)
        {
            _writes += _datas[_next_index];
            ++_next_index;
            --_unassembled_bytes;
        }
        _output.write(_writes);
    }
    
    if(_eof && empty())
    {
        _output.end_input();
    }

}

size_t StreamReassembler::unassembled_bytes() const { return _unassembled_bytes; }

bool StreamReassembler::empty() const { return _unassembled_bytes == 0; }
