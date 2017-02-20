if (process.argv.length == 2) {
    while (1) {
        console.log("y")
    }
} else {
    while (1) {
        for (i = 2; i < process.argv.length; i++) {
            process.stdout.write(process.argv[i] + " ")
        }
        console.log()
    }
}
