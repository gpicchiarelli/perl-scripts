#!/usr/bin/perl
# Generatore ASCII Art
# Categoria: Grafica
# Licenza: BSD
use strict;
use warnings;
use Text::FIGlet;

my $figlet = Text::FIGlet->new(-f => "standard");
print $figlet->figify("Ciao Perl!");
