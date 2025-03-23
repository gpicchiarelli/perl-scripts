#!/usr/bin/perl
# Tokenizzazione testo con regex
# Licenza: BSD
use strict;
use warnings;

my $text = "Questo è un esempio di tokenizzazione.";
my @tokens = split(/\W+/, $text);
print "Token: @tokens\n";
