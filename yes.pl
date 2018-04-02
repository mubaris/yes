#!/usr/bin/env perl

my $msg =
    @ARGV
    ? (splice @ARGV) . "\n"
    : "y\n";

print $msg while 1;
