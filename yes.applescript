on run args
	if count of args is greater than 0
		set applescript's text item delimiters to " "
		set pn to (args as string)
		repeat 
			log pn
		end
	else
		repeat
			log "y"
		end
	end
end

