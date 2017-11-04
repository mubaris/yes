#!/usr/bin/env lua

if #arg == 0 then
  line = "y"
else
  line = table.concat(arg, " ")
end

while true do
  print(line)
end
