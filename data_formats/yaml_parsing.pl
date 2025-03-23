#!/usr/bin/perl
# Parsing YAML realistico
# Licenza: BSD
use strict;
use warnings;
use YAML::XS;

my $yaml = "---\nnome: Marco\netà: 28\ncittà: Firenze\n";
my $data = Load($yaml);

print "Nome: $data->{nome}, Età: $data->{età}, Città: $data->{città}\n";
