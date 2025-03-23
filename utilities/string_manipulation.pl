#!/usr/bin/perl
# Manipolazione avanzata stringhe
# Licenza: BSD
use strict;
use warnings;

my $text = "   Perl è fantastico!  ";
$text =~ s/^\s+|\s+$//g; # trim
$text = uc($text); # uppercase
print "Testo modificato: $text\n";
