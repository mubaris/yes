fun main(args: Array<String>) {
    val output = if (args.isNotEmpty()) args.joinToString(" ") else "y"

    while (true) {
        println(output)
    }
}
