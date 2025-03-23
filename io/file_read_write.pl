#!/usr/bin/perl
# File Reading and Writing Example
# Licenza: BSD

use strict;
use warnings;
my $filename = "example.txt";

open(my $fh, '>', $filename) or die "Non posso aprire '$filename': $!";
print $fh "Hello, Perl!
";
close $fh;

open($fh, '<', $filename) or die "Non posso aprire '$filename': $!";
while (my $row = <$fh>) {
  chomp $row;
  print "Linea letta: $row
";
}
close $fh;
