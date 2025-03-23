#!/usr/bin/perl
# Gestione processi realistico
# Categoria: Amministrazione
# Licenza: BSD
use strict;
use warnings;

my @processes = `ps aux`;
foreach my $process (@processes) {
    print $process;
}
