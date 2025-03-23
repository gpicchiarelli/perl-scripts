#!/usr/bin/perl
# Operazioni su Directory
# Categoria: File e I/O
# Licenza: BSD

use strict;
use warnings;
use File::Find;

my $dir = '.';

find(sub {
    print "$File::Find::name\n" if -f;
}, $dir);
