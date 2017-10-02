#!/usr/bin/env julia

while true
	if length(ARGS) == 0
		println("yes")
	else
		println(ARGS[1])
	end
end
