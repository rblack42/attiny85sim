#include <iostream>
#include "Wire.h"
#include "Component.h"
#include "Clock.h"
#include "Controller.h"

const int MAXTICKS = 5;

// create parts
Wire c1_c2;
Component c1, c2;
Controller cntrl;
Clock sysclock;

int main( int argc, char *argv[] ) {
    std::cout << "attinysim v(0.5.0)" << std::endl;
    std::cout << "running ..." << std::endl;
    cntrl.load_microcode("microcode.txt");
    for(int i=0;i<MAXTICKS;i++) {
        sysclock.tick();
        cntrl.step();
    }
    std::cout 
        << "done! (clock ticks: " 
        << sysclock.get_rtc() << ")" 
        << std::endl;
}
