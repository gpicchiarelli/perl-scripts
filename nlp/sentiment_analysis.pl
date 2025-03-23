#!/usr/bin/perl
# Analisi del Sentiment Semplice
# Categoria: NLP
# Licenza: BSD
use strict;
use warnings;
use Lingua::EN::Sentiment;

my $analyzer = Lingua::EN::Sentiment->new();
my $text = "I love programming in Perl. It's fantastic!";

my $score = $analyzer->sentiment($text);
print "Sentiment score: $score\n";
