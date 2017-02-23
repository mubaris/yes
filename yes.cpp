#include <iostream>
#include <sstream>

using std::stringstream;
using std::string;
using std::cout;

int main(int argc, char* argv[]) {
	stringstream builder;
	string output;
	
	// Build string.
	if (argc > 1) {
		builder << argv[1];
		for (int i = 2; i < argc; i++) {
			builder << " " << argv[i];
		}
		builder << "\n";
	} else {
		builder << "y\n";
	}

	// Output string.
	output = builder.str();
	while (true) {
		cout << output;
	}
}

