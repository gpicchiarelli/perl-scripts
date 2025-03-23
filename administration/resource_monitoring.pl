#!/usr/bin/perl
# Monitoraggio delle risorse (CPU e memoria)
# Licenza: BSD
use strict;
use warnings;
use Sys::Statistics::Linux;

my $lxs = Sys::Statistics::Linux->new(cpustats => 1, memstats => 1);
sleep(1);
my $stats = $lxs->get;

print "Utilizzo CPU: " . $stats->cpustats->{cpu}->{total} . "%\n";
print "Memoria libera: " . ($stats->memstats->{memfree} / 1024) . " MB\n";
