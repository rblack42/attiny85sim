#pragma once

class Clock {
    public:
        Clock();    // default constructor
        int get_rtc(void);
        void tick(void);
    private:
        int RTC;
};

