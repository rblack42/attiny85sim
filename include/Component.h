#pragma once
#include <cstdint>

class Component {
    public:
        Component();                // default constructor
        int get_id(void);           // return this component's id
        uint16_t read(void);        // return current component signal
        void write(uint16_t val);   // set component signal value (for testing)
    private:
        static int component_id;    // class id assigned to each component
        int id;                     // this component's id
        uint16_t data;              // this component's current value
};


