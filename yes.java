class yes {
    public static void main (String[] args) {
        if (args.length == 0) {
            while (true) {
                System.out.println("y");
            }
        } else {
            String line = String.join(" ", args);
            while (true) {
                System.out.println(line);
            }
        }
    }
}
