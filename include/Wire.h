#pragma once
#include <cstdint>

class Wire {
    public:
        Wire();                         // default constructor
        int get_id(void);               // return this wire's id
        uint16_t read(void);            // return current wire signal
        void write(uint16_t val);       // set current wire signal
    private:
        static int wire_id;             // class id assigned to each wire
        int id;                         // this wires id
        uint16_t data;                  // this wire's current value
};


