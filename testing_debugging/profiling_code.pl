#!/usr/bin/perl
# Profiling realistico con Devel::NYTProf
# Licenza: BSD
use strict;
use warnings;

# Esegui: perl -d:NYTProf profiling_code.pl poi nytprofhtml
for (my $i = 0; $i < 1000; $i++) {
    my $x = $i ** 2;
}
print "Profiling completato.\n";
