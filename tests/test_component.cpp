#include "catch.hpp"
#include "Component.h"

TEST_CASE( "component constructor test", "component" ){
    Component c1,c2;
    REQUIRE(c1.get_id() == 100);
    REQUIRE(c2.get_id() == 101);
    REQUIRE(c1.read() == 0);
}

TEST_CASE( "component get/set test", "component" ){
    Component c1;
    c1.write(123);
    REQUIRE(c1.get_id() == 102);
    REQUIRE(c1.read() == 123);
}
