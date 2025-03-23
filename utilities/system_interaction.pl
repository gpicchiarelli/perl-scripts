#!/usr/bin/perl
# Interazione con il sistema operativo
# Licenza: BSD
use strict;
use warnings;

my $output = `ls -l`;
print "Output del comando: $output\n";
