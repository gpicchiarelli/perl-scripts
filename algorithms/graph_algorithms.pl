#!/usr/bin/perl
# Algoritmo BFS su grafo
# Licenza: BSD
use strict;
use warnings;
use Graph;

my $g = Graph->new;
$g->add_edge('A', 'B');
$g->add_edge('B', 'C');

my @bfs = $g->bfs('A');
print "BFS dal nodo A: @bfs\n";
