cmake_minimum_required (VERSION 3.9.0 FATAL_ERROR)

project(amd-asm_optimization)

set(CMAKE_SUPPRESS_REGENERATION true)

set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "" FORCE) 

set(CMAKE_CXX_STANDARD 20)

add_definitions(-DUNICODE -D_UNICODE)

option(BUILD_FROM_SOURCES "Build all libs from sources." OFF)

add_subdirectory(optimizer)