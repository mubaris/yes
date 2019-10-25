#!/bin/sh

OUT=$* && [ -z "$OUT" ] && OUT="y"

while :
do
    printf "%s\n" "$OUT"
done
