#pragma once

#include <CL/cl.h>
#include <vector>
#include <string>
#include <functional>
#include <fstream>

enum OclVendor {
	OCL_VENDOR_UNKNOWN,
	OCL_VENDOR_AMD,
	OCL_VENDOR_NVIDIA,
	OCL_VENDOR_INTEL
};

std::vector<cl_device_id> getClDevices();

OclVendor getClDeviceVendor(cl_device_id device);

std::string getClDeviceName(cl_device_id device);

cl_kernel getKernel(cl_context context, cl_device_id device, const unsigned char* programBinary, size_t programSize, const char* kernelName);

bool getProgramFromSource(std::string file, cl_context& context, cl_device_id& device, cl_program& program);

template <typename T> class OclObjectGuard {
public:
	OclObjectGuard(T obj, std::function<void(T)> releaseObject)
		: oclObject(obj), releaseObject(releaseObject)
	{
	}
	~OclObjectGuard()
	{
		if (oclObject != nullptr) {
			releaseObject(oclObject);
		}
	}

private:
	T oclObject;
	std::function<void(T)> releaseObject;
};