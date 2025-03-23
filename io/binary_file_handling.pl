#!/usr/bin/perl
# Gestione file binari
# Licenza: BSD
use strict;
use warnings;

open(my $fh, '>:raw', 'binary.dat') or die $!;
print $fh pack('C*', (65, 66, 67));
close($fh);

open($fh, '<:raw', 'binary.dat') or die $!;
read($fh, my $data, 3);
print "Contenuto binario: ", unpack('C*', $data), "\n";
close($fh);
