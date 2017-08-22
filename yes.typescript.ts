
declare var process;

namespace yes {

    // Get output string.
    let output: string = "y\n";

    if (process.argv.length !== 2) {
        output = `${process.argv.slice(2).join(' ')}\n`;
    }
    
    // Write.
    var flood = () => {
        while (process.stdout.write(buffer) !== false);
    }
    
    const buffer: string = output.repeat(Math.max(1, Math.floor(4096 / output.length)));
    process.stdout.on('drain', flood);
    flood();
}    
