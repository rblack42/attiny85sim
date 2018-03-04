#include "Wire.h"

int Wire::wire_id = 100;

// constructor
Wire::Wire() {
    data = 0;       // wire value is initially 0
    id = wire_id++; // get the next available wire id
}

// Accessors do not modify object state
int Wire::get_id(void) {
    // return this wire id
    return id;
}

uint16_t Wire::read(void) {
    // return current wire signal value
    return data;
}

void Wire::write(uint16_t val) {
    data = val;
}

