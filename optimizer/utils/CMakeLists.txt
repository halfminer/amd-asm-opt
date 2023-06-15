cmake_minimum_required(VERSION 3.8)

find_package(OpenCL REQUIRED)

set(UTILS_SRC ClUtils.h 
              ClUtils.cpp)

add_library(utils ${UTILS_SRC})

target_link_libraries(utils OpenCL::OpenCL)