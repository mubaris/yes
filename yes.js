// Get output string.
let output = "y\n";
if (process.argv.length !== 2) {
	output = process.argv.slice(2).join(' ') + "\n";
}

// Write.
function flood() {
	while (process.stdout.write(buffer) !== false);
}

const buffer = output.repeat(Math.floor(4096 / output.length));
process.stdout.on('drain', flood);
flood();

