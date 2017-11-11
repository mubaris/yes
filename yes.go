package main

import (
	"bufio"
	"os"
)

var bufsize = 64 * 1024

func main() {
	var y []byte
	// Get arg
	if len(os.Args) > 1 {
		y = []byte(os.Args[1] + "\n")
	} else {
		// Set output to y
		y = []byte("y\n")
	}
	yLen := len(y)

	// Create buffer
	buf := make([]byte, bufsize)
	// Popoulate buffer
	for i := 0; i < len(buf)-yLen; i += yLen {
		for s := 0; s < len(y); s++ {
			buf[i+s] = y[s]
		}
	}

	// Create buffered writer
	f := bufio.NewWriterSize(os.Stdout, bufsize)
	defer f.Flush()
	for {
		f.Write(buf)
	}
}
