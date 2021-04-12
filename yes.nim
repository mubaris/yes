# yes nim

#[
   How to build and execute
  
   Build:
   nim compile yes.nim
  
   option 1 - output 'yes'
   ./yes
  
   option 2 - output argument list
   ./yes argument_list
]#


import os
import strutils


proc yes(): void =
  var yes = ""
  if paramCount() > 0:
    yes = commandLineParams().join(" ")
    echo(yes)
  else:
    yes = "yes"
  while true:
    echo(yes)


when isMainModule:
  yes()

