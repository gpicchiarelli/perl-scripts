#!/usr/bin/perl
# Operazioni Data e Ora avanzate
# Licenza: BSD
use strict;
use warnings;
use DateTime;

my $dt = DateTime->now(time_zone => 'Europe/Rome');
print "Data/Ora attuale: " . $dt->ymd . ' ' . $dt->hms . "\n";

$dt->add(days => 10);
print "Data tra 10 giorni: " . $dt->ymd . "\n";
