#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define max(a,b) \
	({ __typeof__ (a) _a = (a); \
	 __typeof__ (b) _b = (b); \
	 _a > _b ? _a : _b; });


int main(int argc, char* argv[]) {
	char* output;
	int output_size;
	int output_len;

	if (argc > 1) {
		// Create buffer.
		int needed_size = 2 + strlen(argv[1]);
		for (int i = 2; i < argc; i++) {
			needed_size += 1 + strlen(argv[i]);
		}

		output = (char*) malloc(needed_size);
		
		// Append to buffer.
		strcat(output, argv[1]);
		for (int i = 2; i < argc; i++) {
			strcat(output, " ");
			strcat(output, argv[i]);
		}
		strcat(output, "\n");
		output_len = strlen(output);
	} else {
		output = "y\n";
		output_len = 2;
	}

	// Flood.
	while (1) {
		fwrite(output, 1, output_len, stdout);
	}	
}

