#!/usr/bin/perl
# Ricerca Binaria
# Categoria: Algoritmi
# Licenza: BSD

use strict;
use warnings;

sub binary_search {
    my ($arr, $target) = @_;
    my ($low, $high) = (0, @$arr - 1);

    while ($low <= $high) {
        my $mid = int(($low + $high) / 2);
        return $mid if $arr->[$mid] == $target;
        if ($arr->[$mid] < $target) {
            $low = $mid + 1;
        } else {
            $high = $mid - 1;
        }
    }
    return -1;
}

my @data = (1, 3, 5, 7, 9);
my $index = binary_search(\@data, 5);
print "Elemento trovato in posizione: $index\n";
