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

