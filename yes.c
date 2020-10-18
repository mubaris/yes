#include <stdio.h>
#include <stdlib.h>
#include <string.h>

///////////////////////////////////
// How to build and execute
//
// Build:
// gcc -o yes yes.c
//
// option 1 - output 'yes'
// ./yes
//
// option 2 - output argument list
// ./yes argument_list

int main(int argc, char* argv[]) {
	char* output;
	int output_size;
	int output_len;

	if (argc > 1) {
		// Calculate output buffer size.
		output_len = 0;
		for (int i = 1; i < argc; i++) {
			output_len += strlen(argv[i]);
		}
		output_len += argc - 2; // Spaces between arguments.
		output_len++; // Newline.

		// Allocate output buffer.
		output = (char*) malloc(output_len + 1); // Plus one for the null terminator.

		// Append to buffer.
		strcat(output, argv[1]);
		for (int i = 2; i < argc; i++) {
			strcat(output, " ");
			strcat(output, argv[i]);
		}
		strcat(output, "\n");
	} else {
		output = "y\n";
		output_len = 2;
	}

	// Flood.
	for(;;)
		fwrite(output, 1, output_len, stdout);
}

