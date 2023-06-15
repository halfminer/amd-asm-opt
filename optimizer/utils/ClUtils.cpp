#include "clutils.h"

std::vector<cl_device_id> getClDevices()
{
	cl_uint nPlatforms = 0;
	std::vector<cl_device_id> allDevices;
	cl_int clRet = clGetPlatformIDs(0, nullptr, &nPlatforms);
	
	if (CL_SUCCESS != clRet || 0 == nPlatforms) {
		//printf("No compatible OpenCL platforms found\n");
		return allDevices;
	}
	
	std::vector<cl_platform_id> platforms(nPlatforms);
	clGetPlatformIDs(nPlatforms, platforms.data(), nullptr);
	
	for (cl_uint i = 0; i < nPlatforms; i++) {
		cl_uint nDevices = 0;
		clGetDeviceIDs(platforms[i], CL_DEVICE_TYPE_GPU, 0, nullptr, &nDevices);

		std::vector<cl_device_id> devices(nDevices);
		
		clGetDeviceIDs(platforms[i], CL_DEVICE_TYPE_GPU, nDevices, devices.data(), 0);

		allDevices.insert(allDevices.end(), devices.begin(), devices.end());
	}
	return allDevices;
}

OclVendor getClDeviceVendor(cl_device_id device)
{
	size_t size = 0;
	cl_int clStatus =
		clGetDeviceInfo(device, CL_DEVICE_VENDOR, 0, nullptr, &size);
	if (CL_SUCCESS != clStatus) {
		return OCL_VENDOR_UNKNOWN;
	}
	std::vector<char> vendorNameBytes(size);
	clStatus = clGetDeviceInfo(device, CL_DEVICE_VENDOR, vendorNameBytes.size(),
		vendorNameBytes.data(), nullptr);
	if (CL_SUCCESS != clStatus) {
		return OCL_VENDOR_UNKNOWN;
	}

	std::string vendorName(vendorNameBytes.begin(), vendorNameBytes.end());

	if (vendorName.find("Advanced Micro Devices") != std::string::npos) {
		return OCL_VENDOR_AMD;
	}
	else if (vendorName.find("NVIDIA") != std::string::npos) {
		return OCL_VENDOR_NVIDIA;
	}
	else if (vendorName.find("Intel") != std::string::npos) {
		return OCL_VENDOR_INTEL;
	}
	return OCL_VENDOR_UNKNOWN;
}

static const int CL_DEVICE_BOARD_NAME_AMD = 0x4038;

std::string getDeviceAsicName(cl_device_id device)
{
	std::size_t nameSize = 0;
	cl_int clStatus = clGetDeviceInfo(device, CL_DEVICE_NAME, 0, nullptr, &nameSize);
	if (CL_SUCCESS != clStatus) {
		return "";
	}

	std::vector<char> name(nameSize);
	clStatus = clGetDeviceInfo(device, CL_DEVICE_NAME, name.size(), name.data(), nullptr);

	if (CL_SUCCESS != clStatus) {
		return "";
	}

	std::string deviceName = std::string(name.data());

	size_t foundSuffix = deviceName.find(":xnack-");
	if (foundSuffix != std::string::npos) {
		// Trim the name so it doesn't contain the :xnack- suffix.
		deviceName = deviceName.substr(0, foundSuffix);
	}
	else {
		foundSuffix = deviceName.find(":xnack+");
		if (foundSuffix != std::string::npos) {
			// Append the xnack suffix.
			deviceName = deviceName.substr(0, foundSuffix) + "_xnack";
		}
	}


	return deviceName;
}

std::string getClDeviceName(cl_device_id device)
{
	size_t size = 0;
	// Get standard OpenCL device name by default.
	cl_device_info nameInfoId = CL_DEVICE_NAME;

	cl_int clStatus =
		clGetDeviceInfo(device, CL_DEVICE_EXTENSIONS, 0, nullptr, &size);
	if (CL_SUCCESS == clStatus) {
		std::vector<char> extensions(size);
		clStatus = clGetDeviceInfo(device, CL_DEVICE_EXTENSIONS, extensions.size(),
			extensions.data(), nullptr);
		if (CL_SUCCESS == clStatus) {
			std::string extensionsSting(extensions.begin(), extensions.end());
			if (extensionsSting.find("cl_amd_device_attribute_query") !=
				std::string::npos) {
				// AMD extension is supported, can get AMD-specific board name.
				nameInfoId = CL_DEVICE_BOARD_NAME_AMD;
			}
		}
	}
	clStatus = clGetDeviceInfo(device, nameInfoId, 0, nullptr, &size);
	if (CL_SUCCESS != clStatus) {
		return "";
	}
	std::vector<char> nameBytes(size);
	clStatus = clGetDeviceInfo(device, nameInfoId, nameBytes.size(),
		nameBytes.data(), nullptr);
	if (CL_SUCCESS != clStatus) {
		return "";
	}
	std::string name(nameBytes.data());
	if (CL_DEVICE_BOARD_NAME_AMD == nameInfoId) {
		std::string asicName = getDeviceAsicName(device);
		if (!asicName.empty()) {
			name += " (" + asicName + ")";
		}
	}
	return name;
}

cl_kernel getKernel(cl_context context, cl_device_id device, const unsigned char* programBinary, size_t programSize, const char* kernelName)
{
	cl_int clStatus = CL_SUCCESS;
	cl_program program = clCreateProgramWithBinary(context, 1, &device, &programSize, &programBinary, nullptr, &clStatus);
	if (CL_SUCCESS != clStatus) {
		return nullptr;
	}
	clStatus = clBuildProgram(program, 1, &device, "", nullptr, nullptr);
	if (CL_SUCCESS != clStatus) {
		return nullptr;
	}
	OclObjectGuard<cl_program> programGuard(program, clReleaseProgram);

	cl_kernel k = clCreateKernel(program, kernelName, &clStatus);
	if (CL_SUCCESS != clStatus) {
		return nullptr;
	}
	return k;
}

bool getProgramFromSource(std::string file, cl_context& context, cl_device_id& device, cl_program& program) {
	std::ifstream in;

	in.open(file);

	if (in.fail()) {
		return false;
	}

	cl_int clStatus = 0;

	std::string code((std::istreambuf_iterator<char>(in)), std::istreambuf_iterator<char>());

	if (in.fail()) {
		return false;
	}

	in.close();

	const size_t code_size = code.size();
	const char* code_string = code.data();
	program = clCreateProgramWithSource(context, 1, &code_string, &code_size, &clStatus);
	if (clStatus != CL_SUCCESS) {
		return false;
	}

	std::string options = "";

	clStatus = clBuildProgram(program, 1, &device, options.c_str(), nullptr, nullptr);
	if (clStatus != CL_SUCCESS) {
		return false;
	}

	return true;
}
