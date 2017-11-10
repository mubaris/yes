package main

import (
	"bufio"
	"os"
)

var bufsize = 64 * 1024

func main() {
	y := byte('y')
	n := byte('\n')
	buf := make([]byte, bufsize)
	for i := 0; i < len(buf)-2; i += 2 {
		buf[i] = y
		buf[i+1] = n
	}
	f := bufio.NewWriterSize(os.Stdout, bufsize)
	defer f.Flush()
	for {
		f.Write(buf)
	}
}
