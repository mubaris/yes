#!/usr/bin/env tclsh

if {$argc == 0} {
    set msg "y"
} else {
    set msg [join $argv " "]
}

while {1} { puts stdout $msg }
