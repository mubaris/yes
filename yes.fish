#!/usr/bin/env fish
if [ (count $argv) -gt 0 ]
	while true
		echo "$argv"
	end
else
	while true
		echo "y"
	end
end

