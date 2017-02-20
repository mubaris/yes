package main

import "fmt"
import "os"

func main() {
	argc := len(os.Args[:])
	if argc == 1 {
		for {
			fmt.Println("y")
		}
	} else {
		for {
			for i := 1; i < argc; i++ {
				fmt.Printf("%s ", os.Args[i])
			}
			fmt.Println()
		}
	}
}
