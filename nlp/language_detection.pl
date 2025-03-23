#!/usr/bin/perl
# Rilevamento lingua semplice con Lingua::Identify
# Licenza: BSD
use strict;
use warnings;
use Lingua::Identify qw(langof);

my $text = "Questo testo è scritto in italiano.";
print "Lingua rilevata: ", langof($text), "\n";
