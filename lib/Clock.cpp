#include "Clock.h"

Clock::Clock() {    // default constructor
    RTC = 0;
}

int Clock::get_rtc(void) {
    return RTC;
}

void Clock::tick(void) {
    RTC++;
}
