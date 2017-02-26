#!/usr/bin/env perl

if (!@ARGV) {
    while (1) {
        print "y\n";
    }
} else {
    while (1) {
        print "@ARGV\n";
    }
}
