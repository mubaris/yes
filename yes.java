class yes {
    public static void main (String[] args) {
        if (args.length == 0) {
            while (true) {
                System.out.println("y");
            }
        } else {
            while (true) {
                for (int i = 0; i < args.length; i++) {
                    System.out.printf("%s ", args[i]);
                }
                System.out.println();
            }
        }
    }
}
