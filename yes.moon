line = nil
if #arg == 0
    line = "y"
else
    line = table.concat arg, " "

while true
    print line
