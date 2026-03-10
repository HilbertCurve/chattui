cmake_minimum_required(VERSION 3.10)

project(chattui VERSION 0.1)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(Curses REQUIRED)
# the following are from the cmake docs
# https://cmake.org/cmake/help/latest/module/FindCurses.html
if(Curses_FOUND AND NOT TARGET Curses::Curses)
    add_library(Curses::Curses INTERFACE IMPORTED)
    set_target_properties(
        Curses::Curses
        PROPERTIES
        INTERFACE_LINK_LIBRARIES "${CURSES_LIBRARIES}"
        INTERFACE_INCLUDE_DIRECTORIES "${CURSES_INCLUDE_DIRS}"
    )
endif()

add_executable(chattui
    src/main.cpp
    src/App.cpp

    include/Client.hpp
    include/App.hpp
)

target_include_directories(chattui PRIVATE
    ${CMAKE_SOURCE_DIR}/include
    ${CURSES_INCLUDE_DIRS}
)

target_link_libraries(chattui PRIVATE Curses::Curses)

