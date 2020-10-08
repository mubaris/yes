#!/usr/bin/env fish

[ -n "$argv" ]; and set s "$argv"; or set s "y"
while :
    echo "$s"
end
