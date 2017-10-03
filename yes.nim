import os, strutils, sequtils

proc yes() =
  var args : string

  if paramCount() == 0:
    args = "y"
  else:
    args = commandLineParams().mapIt(string, $it).join(" ")

  while true:
    echo args

yes()
