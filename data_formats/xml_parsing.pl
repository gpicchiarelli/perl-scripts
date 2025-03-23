#!/usr/bin/perl
# Parsing XML completo
# Licenza: BSD
use strict;
use warnings;
use XML::Simple;

my $xml = '<persona><nome>Luca</nome><età>32</età></persona>';
my $data = XMLin($xml);
print "Nome: $data->{nome}, Età: $data->{età}\n";
