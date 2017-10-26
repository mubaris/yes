///////////////////////////////////
// How to build and execute
// Version - Java 8 (required)
//
// Build:
// javac yes.java
//
// option 1 - output 'yes'
// java yes 
//
// option 2 - output argument list
// java yes argument_list


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
