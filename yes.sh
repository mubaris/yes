#!/bin/sh

OUT=$* && [ -z "$OUT" ] && OUT="y"

while :
do
    echo "$OUT"
done
