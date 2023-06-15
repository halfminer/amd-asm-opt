#include "gtest/gtest.h"
#include <iostream>
#include "ClUtils.h"
#include <algorithm>
#include "CL/cl.h"

TEST(VgprBankConflicts, SmallGS) {
    const size_t RUNS_AMOUNT = 1'024 * 64 * 2;

    auto devices = getClDevices();

    std::cout << "Keccak benchmark test running from OpenCL sources" << std::endl;

    cl_int clStatus = 0;
    std::vector<std::string> kernelAllNames = { "bank_read_conflicts", "no_bank_conflicts", "bank_read_and_write_conflict", "bank_conflict1_read_write", "bank_conflict1_read"};

    for (auto device : devices) {
        if (OCL_VENDOR_INTEL == getClDeviceVendor(device) || OCL_VENDOR_NVIDIA == getClDeviceVendor(device)) {
            std::cout << "Skipping not AMD device " << getClDeviceName(device) << std::endl;
            continue;
        }

        std::cout << "Running test on " << getClDeviceName(device) << std::endl;

        cl_context context = clCreateContext(nullptr, 1, &device, nullptr, nullptr, &clStatus);
        ASSERT_EQ(clStatus, CL_SUCCESS);

        cl_command_queue queue = clCreateCommandQueue(context, device, CL_QUEUE_PROFILING_ENABLE, &clStatus);
        ASSERT_EQ(CL_SUCCESS, clStatus);

        cl_program program;
        
        if (!getProgramFromSource("examples/keccak-src.cl", context, device, program)) {
            continue;
        }

        std::vector<std::pair<std::string, cl_kernel>> kernels;
        std::vector<size_t> localSizes;

        for (std::string kernelName: kernelAllNames) {
            cl_kernel keccakKernel = clCreateKernel(program, kernelName.c_str(), &clStatus);
            if (clStatus != CL_SUCCESS) {
                std::cout << "Could not compile " << kernelName << " kernel for " << getClDeviceName(device) << std::endl;
                continue;
            }
            kernels.emplace_back(kernelName, keccakKernel);
        }

        std::vector<double> times(kernels.size(), double(0.0));
        cl_event event;

        for (size_t test = 0; test < RUNS_AMOUNT; test++) {
            for (size_t kernel_idx = 0; kernel_idx < kernels.size(); kernel_idx++) {
                std::string kernel_name = kernels[kernel_idx].first;
                cl_kernel& kernel = kernels[kernel_idx].second;
                size_t newLocalSizes[1] = { 32 };
                size_t globalSizes[1] = { 32 };
                ASSERT_EQ(CL_SUCCESS, clEnqueueNDRangeKernel(queue, kernel, 1, 0, globalSizes, newLocalSizes, 0, nullptr, &event));
                clFinish(queue);
                cl_ulong start_time, finish_time;
                clGetEventProfilingInfo(event, CL_PROFILING_COMMAND_START, sizeof(cl_ulong), &start_time, nullptr);
                clGetEventProfilingInfo(event, CL_PROFILING_COMMAND_END, sizeof(cl_ulong), &finish_time, nullptr);
                times[kernel_idx] += static_cast<double>(finish_time - start_time) / 1'000'000;
            }
        }

        double best_time = *std::min_element(times.begin(), times.end());

        for (size_t i = 0; i < times.size(); i++) {
            std::cout << "Kernel " << kernels[i].first << " : " << times[i] / best_time * 100.0 << "%" << std::endl;
        }
    }

}


TEST(VgprBankConflicts, BigGs) {
    const size_t RUNS_AMOUNT = 1024 * 4;

    auto devices = getClDevices();

    std::cout << "Keccak benchmark test running from OpenCL sources" << std::endl;

    cl_int clStatus = 0;
    std::vector<std::string> kernelAllNames = { "bank_read_conflicts", "no_bank_conflicts", "bank_read_and_write_conflict", "bank_conflict1_read_write", "bank_conflict1_read" };

    for (auto device : devices) {
        if (OCL_VENDOR_INTEL == getClDeviceVendor(device) || OCL_VENDOR_NVIDIA == getClDeviceVendor(device)) {
            std::cout << "Skipping not AMD device " << getClDeviceName(device) << std::endl;
            continue;
        }

        std::cout << "Running test on " << getClDeviceName(device) << std::endl;

        cl_context context = clCreateContext(nullptr, 1, &device, nullptr, nullptr, &clStatus);
        ASSERT_EQ(clStatus, CL_SUCCESS);

        cl_command_queue queue = clCreateCommandQueue(context, device, CL_QUEUE_PROFILING_ENABLE, &clStatus);
        ASSERT_EQ(CL_SUCCESS, clStatus);

        cl_program program;

        if (!getProgramFromSource("examples/keccak-src.cl", context, device, program)) {
            continue;
        }

        std::vector<std::pair<std::string, cl_kernel>> kernels;
        std::vector<size_t> localSizes;

        for (std::string kernelName : kernelAllNames) {
            cl_kernel keccakKernel = clCreateKernel(program, kernelName.c_str(), &clStatus);
            if (clStatus != CL_SUCCESS) {
                std::cout << "Could not compile " << kernelName << " kernel for " << getClDeviceName(device) << std::endl;
                continue;
            }
            kernels.emplace_back(kernelName, keccakKernel);
        }

        std::vector<double> times(kernels.size(), double(0.0));
        cl_event event;

        for (size_t test = 0; test < RUNS_AMOUNT; test++) {
            for (size_t kernel_idx = 0; kernel_idx < kernels.size(); kernel_idx++) {
                std::string kernel_name = kernels[kernel_idx].first;
                cl_kernel& kernel = kernels[kernel_idx].second;
                size_t newLocalSizes[1] = { 32 };
                size_t globalSizes[1] = { 4096 * 64 * 4 };
                ASSERT_EQ(CL_SUCCESS, clEnqueueNDRangeKernel(queue, kernel, 1, 0, globalSizes, newLocalSizes, 0, nullptr, &event));
                clFinish(queue);
                cl_ulong start_time, finish_time;
                clGetEventProfilingInfo(event, CL_PROFILING_COMMAND_START, sizeof(cl_ulong), &start_time, nullptr);
                clGetEventProfilingInfo(event, CL_PROFILING_COMMAND_END, sizeof(cl_ulong), &finish_time, nullptr);
                times[kernel_idx] += static_cast<double>(finish_time - start_time) / 1'000'000;
            }
        }

        double best_time = *std::min_element(times.begin(), times.end());

        for (size_t i = 0; i < times.size(); i++) {
            std::cout << "Kernel " << kernels[i].first << " : " << times[i] / best_time * 100.0 << "%" << std::endl;
        }
    }

}

int main(int argc, char* argv[]) {
	::testing::InitGoogleTest(&argc, argv);
	return RUN_ALL_TESTS();
}