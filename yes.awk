#!/bin/awk -f

BEGIN {
    for (i = 1; i < ARGC; i++) {
        yes = ((yes)(ARGV[i])" ")
    }

    if (!yes) {
        yes = "y";
    }

    while(1) {
        print yes;
    }
}


