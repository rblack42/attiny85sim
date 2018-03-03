#include "catch.hpp"
#include "Wire.h"

TEST_CASE( "wire constructor test", "wire" ){
    Wire t1,t2;
    REQUIRE(t1.get_id() == 100);
    REQUIRE(t2.get_id() == 101);
    REQUIRE(t2.get_data() == 0);
}
