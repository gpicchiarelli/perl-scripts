#!/usr/bin/perl
# Gestione Thread avanzata
# Licenza: BSD
use strict;
use warnings;
use threads;

sub lavoro_thread {
    my $id = shift;
    print "Thread $id avviato\n";
    sleep 2;
    print "Thread $id completato\n";
}

my @threads;
for (1..3) {
    push @threads, threads->create(\&lavoro_thread, $_);
}

$_->join() for @threads;
