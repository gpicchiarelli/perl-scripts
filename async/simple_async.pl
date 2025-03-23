#!/usr/bin/perl
# Simple Async Example with AnyEvent
# Licenza: BSD

use strict;
use warnings;
use AnyEvent;

my $cv = AnyEvent->condvar;

my $timer = AnyEvent->timer(after => 2, cb => sub {
    print "Evento asincrono eseguito dopo 2 secondi
";
    $cv->send;
});

print "In attesa di evento asincrono...
";
$cv->recv;
