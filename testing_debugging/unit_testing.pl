#!/usr/bin/perl
# Test unitario con Test::Simple
# Categoria: Testing e Debugging
# Licenza: BSD
use strict;
use warnings;
use Test::Simple tests => 2;

ok(1 + 1 == 2, 'Somma funziona');
ok('abc' eq 'abc', 'Confronto stringhe');
