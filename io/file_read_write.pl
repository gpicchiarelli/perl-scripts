#!/usr/bin/perl
# Lettura e scrittura file realistico
# Licenza: BSD
use strict;
use warnings;

open(my $fh, '>', 'file.txt') or die "Errore: $!";
print $fh "Esempio di testo scritto in file\n";
close $fh;

open($fh, '<', 'file.txt') or die "Errore: $!";
print while <$fh>;
close $fh;
