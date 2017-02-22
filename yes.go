package main

import (
	"os"
	"strings"
)

func main() {
	output := "y"
	if len(os.Args) > 1 {
		output = strings.Join(os.Args[1:], " ")
	}

	for {
		println(output)
	}
}
