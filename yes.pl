#!/usr/bin/env perl

my $msg =
    @ARGV
    ? (join " ", splice @ARGV) . "\n"
    : "y\n";

print $msg while 1;
