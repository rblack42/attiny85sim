#include "catch.hpp"
#include "Wire.h"

TEST_CASE( "wire constructor test", "wire" ){
    Wire w1,w2;
    REQUIRE(w1.get_id() == 100);
    REQUIRE(w2.get_id() == 101);
    REQUIRE(w2.read() == 0);
}

TEST_CASE( "wire get/set tests", "wire" ){
    Wire w1;
    w1.write(123);
    REQUIRE(w1.read() == 123);
}
