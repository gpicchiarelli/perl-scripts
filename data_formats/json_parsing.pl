#!/usr/bin/perl
# Parsing JSON realistico
# Categoria: Formati Dati
# Licenza: BSD
use strict;
use warnings;
use JSON;

my $json_text = '{"nome":"Luca","età":30,"città":"Roma"}';
my $perl_data = decode_json($json_text);

print "Nome: $perl_data->{nome}, Età: $perl_data->{età}, Città: $perl_data->{città}\n";
