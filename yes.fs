(*Author: Daniel Cherney (github: @cherneydh)
  
  F# Compiler for F# 4.0 (Open Source Edition)
  Installed using these commands:
  sudo apt update
  sudo apt install fsharp
  
  Command used in Linux Mint 18.2 Terminal:
  fsharpc --out:yes.exe yes.fs
  
  run yes.exe
 *)

open System

let yes() =
 let input = Console.ReadLine()

 if input = "yes" then
  while true do
   printfn "y"
 
 let words = input.Split ' '
 
 let firstcheck = words.[1].Replace("\'","")
 let secondcheck = firstcheck.Replace("\"","")

 while true do
  printfn "%s" secondcheck

yes()
