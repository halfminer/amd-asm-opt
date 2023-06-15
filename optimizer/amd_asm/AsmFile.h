#include <string>
#include <vector>
enum INSTRUCTION_TYPE {
	INSTRUCTION,
	LABEL_DEF,
	JUMP,
	UNKNOWN
};

enum ASM_INSTRUCTION {
	S_LOAD_DWORD,
	S_WAITCNT,
	S_AND_B32,
	S_CBRANCH,
	S_CBRANCH_EXECZ
};

enum ARG_TYPE {
	SCALAR,
	VECTOR,
	CONSTANT,
	LABEL,
	SPECIAL_REGISTERS
};


class reg {
public:
	reg(std::string s) {
		if (isdigit(s[0])) {
			type = CONSTANT;
			name = s;
			return;
		}
		switch (s[0]) {
		case 's': {
			type = SCALAR;
			break;
		}
		case 'v': {
			if (s == "vcc") {
				type = SPECIAL_REGISTERS;
				name = s;
				return;
			}
			if (!isdigit(s[1]) && s[1] != '[') {
				type = SPECIAL_REGISTERS;
				name = s;
				return;
			}
			type = VECTOR;
			break;
		}
		case '.': {
			type = LABEL;
			name = s;
			return;
		}
		default: {
			type = SPECIAL_REGISTERS;
			name = s;
			return;
		}
		}

		name = s;

		int end = name.size();

		if (name.find(' ') != std::string::npos) {
			end = name.find_first_of(' ');
		}

		comment = name.substr(end, name.size() - 1);

		if (type != CONSTANT) {
			if (s[1] == '[') {
				size_t index = name.find(':');

				from = std::stoi(name.substr(2, index));
				to = std::stoi(name.substr(index + 1, end - 2));
			}
			else {

				name = name.substr(1, end - 1);
				from = std::stoi(name);
				to = from;
			}
		}

	}

	bool operator==(const reg& r) {
		if (type != r.type) {
			return false;
		}
		return from == r.from || to == r.to;
	}

	bool operator!=(const reg& r) {
		return !(*this == r);
	}

	friend std::ostream& operator<<(std::ostream& os, const reg& a) {
		switch (a.type) {
		case SCALAR: {
			os << 's';
			break;
		}
		case VECTOR: {
			os << 'v';
			break;
		}
		case SPECIAL_REGISTERS: {
			os << a.name;
			return os;
		}
		}

		switch (a.type) {
		case SCALAR:
		case VECTOR: {
			if (a.from < a.to) {
				os << '[' << std::to_string(a.from) << ':' << std::to_string(a.to) << ']';
			}
			else {
				os << std::to_string(a.from);
			}

			if (!a.comment.empty()) {
				os << a.comment;
			}

			break;
		}
		case CONSTANT:
		case LABEL: {
			os << a.name;
			break;
		}
		}

		return os;

	}

	std::vector<std::string> split() const {
		if (type == CONSTANT || type == LABEL) {
			return { name };
		}
		char c = (type == SCALAR ? 's' : 'v');
		std::vector<std::string> res;
		for (int i = from; i <= to; i++) {
			res.push_back(c + std::to_string(i));
		}
		return res;
	}

	bool contains(const reg& another_reg) const {
		if (type != another_reg.type || type == CONSTANT || another_reg.type == CONSTANT) {
			return false;
		}

		return another_reg.from >= from && another_reg.from <= to;
	}

	ARG_TYPE type;
	int from, to;
	std::string name;
	std::string comment;
};

class instruction {
public:
	instruction(std::string name);

	std::vector<reg> getReadRegisters();

	std::vector<reg> getWriteRegisters();

private:
};


class AsmFile {

};