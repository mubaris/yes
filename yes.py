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

DEFAULT_OUTPUT = "y"

try:
	output = " ".join(sys.argv[1:]) or DEFAULT_OUTPUT
	while True:
		print(output)
except KeyboardInterrupt:
	pass
