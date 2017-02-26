#!/usr/bin/env swift

let args = CommandLine.arguments
var out = "y"
if args.count > 1 {
    out = args[1...args.count-1].joined(separator: " ")   
}
while true { print(out) }
