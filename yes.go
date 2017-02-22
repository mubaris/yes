package main

import (
	"os"
	"strings"
)

func main() {
	if len(os.Args) == 1 {
		for {
			println("y")
		}
	} else {
		output := strings.Join(os.Args[1:], " ")
		for {
			println(output)
		}
	}
}
