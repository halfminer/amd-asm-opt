find_package(OpenCL REQUIRED)

add_library(kernel_runner KernelRunner.h KernelRunner.cpp)

target_link_libraries(kernel_runner OpenCL::OpenCL)