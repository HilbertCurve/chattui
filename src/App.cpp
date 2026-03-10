#include "App.hpp"

#include <ncurses.h>
#include <panel.h>

App::App() {
    initscr();
};

// TODO: currently a dud
void App::update() {

};

App::~App() {
    endwin();
};
