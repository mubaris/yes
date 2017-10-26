///////////////////////////////////
// How to build and execute
//
// Build:
// $ valac -o yes yes.vala
//
// option 1 - output 'yes'
// ./yes
//
// option 2 - output argument list
// ./yes argument_list

class yes {
    public static int main(string[] args) {
		if (args.length == 1) {
			while (true) {
				stdout.printf("y\n");
			}
		} else {
			string pr = string.joinv(" ", args[1:args.length]) + "\n";
			while (true) {
				stdout.printf(pr);
			}
		}
    }
}

