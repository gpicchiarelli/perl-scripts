#!/usr/bin/perl
# Quick Sort Implementation
# Licenza: BSD

use strict;
use warnings;

sub quick_sort {
    return @_ if @_ < 2;
    my $pivot = shift;
    quick_sort(grep { $_ < $pivot } @_),
    $pivot,
    quick_sort(grep { $_ >= $pivot } @_)
}

my @array = (5, 3, 8, 2, 9, 1);
my @sorted = quick_sort(@array);
print "Sorted Array: @sorted
";
