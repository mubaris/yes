fun main(args: Array<String>) {
    var output = "y"

    if (args.size > 0) {
        output = args.joinToString(separator = " ")
    }

    while (true) {
        println(output)
    }
}