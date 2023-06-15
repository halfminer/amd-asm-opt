cmake_minimum_required(VERSION 3.8)

find_package(OpenCL REQUIRED)

include_directories(../utils)

set(EXAMPLES_DIR ../examples)

if (${CMAKE_BUILD_TYPE} STREQUAL "Debug")
    set(BIN_DIR "${CMAKE_CURRENT_BINARY_DIR}/Debug")
else()
    set(BIN_DIR "${CMAKE_CURRENT_BINARY_DIR}/Release")
endif()

include(FetchContent)
FetchContent_Declare(
    googletest
    URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)
# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

enable_testing()

file(COPY ${EXAMPLES_DIR} DESTINATION ${CMAKE_CURRENT_BINARY_DIR})

add_executable(tests BenchmarkTest.cpp)

target_link_libraries(tests GTest::gtest_main OpenCL::OpenCL utils)

include(GoogleTest)
gtest_discover_tests(tests)