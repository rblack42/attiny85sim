#include "catch.hpp"
#include "Clock.h"

TEST_CASE( "clock constructor test", "clock" ){
    Clock clk;
    REQUIRE(clk.get_rtc() == 0);
    clk.tick();
    REQUIRE(clk.get_rtc() == 1);
}
