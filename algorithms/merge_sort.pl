#!/usr/bin/perl
# Implementazione Merge Sort
# Licenza: BSD
use strict;
use warnings;

sub merge_sort {
    my @array = @_;
    return @array if @array <= 1;

    my $mid = int @array / 2;
    my @left = merge_sort(@array[0 .. $mid-1]);
    my @right = merge_sort(@array[$mid .. $#array]);

    my @merged;
    push @merged, @left && @right ? ($left[0] <= $right[0] ? shift @left : shift @right) : @left, @right while @left || @right;
    return @merged;
}

my @sorted = merge_sort(3,1,4,1,5,9,2);
print "Array ordinato: @sorted\n";
