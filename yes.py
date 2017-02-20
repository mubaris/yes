import sys

if len(sys.argv) == 1:
    while True:
        print("y")
else:
    while True:
        print(" ".join(sys.argv[1:]))
