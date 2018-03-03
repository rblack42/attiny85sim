#include "Controller.h"

Controller::Controller() {
}

void Controller::reset(void) {
}

void Controller::run(void) {
}

void Controller::step(void) {
    fetch();
    decode();
    execute();
    retire();
}

void Controller::load_microcode(std::string fname) {
    std::cout << "loading microcode from " << fname << std::endl;
}

void Controller::fetch(void) {
}

void Controller::decode(void) {
}

void Controller::execute(void) {
}

void Controller::retire(void) {
}

