#!/bin/awk -f

##########################
# How to execute
#
# option 1 - output 'yes'
# awk -f yes.awk
# 
# option 2 - output argument list
# awk -f yes.awk argument_list


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


