package main

import (
	"os"
	"strings"
)

func main() {
	var output string

	switch len(os.Args) {
	case 1:
		output = "y"
	default:
		output = strings.Join(os.Args[1:], " ")
	}

	for {
		println(output)
	}
}
