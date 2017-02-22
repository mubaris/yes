if (process.argv.length == 2) {
    while (1) {
        console.log("y")
    }
} else {
    output = ""
    for (i = 2; i < process.argv.length; i++) {
        output += process.argv[i] + " "
    }
    while (1) {
        console.log(output)
    }
}
