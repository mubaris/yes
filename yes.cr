#!/usr/bin/env crystal

if ARGV.size > 0
	string = ARGV.join(" ")
else
	string = "y"
end

while true
	puts string
end
