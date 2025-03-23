#!/usr/bin/perl
# Debugging realistico con Data::Dumper
# Licenza: BSD
use strict;
use warnings;
use Data::Dumper;

my %hash = (nome => 'Anna', età => 27);
print Dumper(\%hash);
