#include "Component.h"

int Component::component_id = 100;

// constructor
Component::Component() {
    data = 0;       // wire value is initially 0
    id = component_id++; // get the next available wire id
}

// Accessors do not modify object state
int Component::get_id(void) {
    // return this component id
    return id;
}

uint16_t Component::read(void) {
    // return current component signal value
    return data;
}

void Component::write(uint16_t val) {
    // set a nw data value in the component
    data = val;
}
