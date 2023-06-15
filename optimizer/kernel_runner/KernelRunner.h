#include <vector>
#include "CL/cl.h"

class Arg {

};

class KernelManager {

};

class KernelRunner {
public:
	KernelRunner(std::vector<Arg> args, KernelManager kernelManager);

	void run(size_t globalSize);

protected:

	void init();

private:
	cl_device_id device_;
};