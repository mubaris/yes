class Yes {
    public static void main(String[] args) {
        String output = "y";

        if (args.length > 0) {
            output = String.join(" ", args);
        }

        while (true) {
            System.out.println(output);
        }
    }
}
