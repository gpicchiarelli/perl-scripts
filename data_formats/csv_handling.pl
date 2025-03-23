#!/usr/bin/perl
# Lettura e Scrittura CSV
# Licenza: BSD
use strict;
use warnings;
use Text::CSV;

my $csv = Text::CSV->new({binary => 1});
open(my $fh, '>', 'output.csv') or die "Errore apertura file: $!";
$csv->say($fh, [qw(Nome Età Città)]);
$csv->say($fh, ['Mario', 35, 'Milano']);
close $fh;

open($fh, '<', 'output.csv') or die "Errore apertura file: $!";
while(my $row = $csv->getline($fh)) {
    print join(", ", @$row), "\n";
}
close $fh;
