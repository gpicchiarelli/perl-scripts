#!/usr/bin/perl
# Quick Sort efficiente
# Licenza: BSD
use strict;
use warnings;

sub quicksort {
    @_ <= 1 ? @_ : (quicksort(grep { $_ < $_[0] } @_[1..$#_]), $_[0], quicksort(grep { $_ >= $_[0] } @_[1..$#_]));
}

my @sorted = quicksort(10, 4, 8, 2, 5);
print "Ordinato: @sorted\n";
