#!/usr/bin/perl
# Riassunto del testo usando Lingua::IT::Summarize
# Licenza: BSD
use strict;
use warnings;
use Lingua::IT::Summarize;

my $testo = "Perl è un linguaggio di scripting potente e versatile utilizzato per diverse applicazioni, dal web scripting all'automazione di sistema. È noto per la sua capacità di elaborazione testi e gestione file.";
my $riassunto = summarize(text => $testo, maxlength => 50);

print "Riassunto: $riassunto\n";
