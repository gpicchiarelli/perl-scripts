#!/usr/bin/perl
# TCP Client completo e funzionale
# Licenza: BSD
use strict;
use warnings;
use IO::Socket::INET;

my $socket = IO::Socket::INET->new('127.0.0.1:5000') or die "Errore connessione: $!";
print $socket "Saluti dal client Perl!\n";
print while <$socket>;
close($socket);
