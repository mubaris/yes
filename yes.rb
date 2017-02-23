#!/usr/bin/env ruby
if ARGV.length == 0
    loop do
        puts "y"
    end
else
	output=ARGV.join(" ");
	loop do
		puts output
	end
end
