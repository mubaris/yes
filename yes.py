#!/usr/bin/env python

##########################
# How to build and execute
#
# option 1 - output 'yes'
# ./yes.py
# or
# python yes.py
#
# option 2 - output argument list
# ./yes.py argument_list
# or
# python yes.py argument_list

import sys

try:
	if len(sys.argv) == 1:
	    while True:
	        print("y")
	output = " ".join(sys.argv[1:])
	while True:
	    print(output)
except KeyboardInterrupt:
	pass