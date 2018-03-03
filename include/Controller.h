#pragma once
#include <string>
#include <cstdint>
#include <iostream>

const int MCODE_SIZE = 100;

class Controller {
    public: 
        Controller();
        void reset(void);
        void run(void);
        void step(void);
        void load_microcode(std::string fname);
    private:
        uint16_t microcode[MCODE_SIZE];
        uint16_t PC;
        uint8_t STATUS;
        void fetch(void);
        void decode(void);
        void execute(void);
        void retire(void);
};

