#!/usr/bin/env python
import sys

if len(sys.argv) == 1:
    while True:
        print("y")
else:
    output = " ".join(sys.argv[1:]);
    while True:
        print(output)

