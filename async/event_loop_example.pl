#!/usr/bin/perl
# Esempio di loop di eventi asincrono (AnyEvent)
# Licenza: BSD
use strict;
use warnings;
use AnyEvent;

my $cv = AnyEvent->condvar;
my $count = 0;

my $w = AnyEvent->timer(interval => 1, cb => sub {
    $count++;
    print "Evento $count\n";
    $cv->send if $count >= 5;
});

$cv->recv;
