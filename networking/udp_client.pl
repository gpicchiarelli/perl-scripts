#!/usr/bin/perl
# Client UDP semplice
# Categoria: Networking
# Licenza: BSD
use strict;
use warnings;
use IO::Socket::INET;

my $socket = IO::Socket::INET->new(
    PeerAddr => 'localhost',
    PeerPort => 5001,
    Proto    => 'udp'
) or die "Impossibile creare socket UDP: $!";

$socket->send("Messaggio da client UDP");
close($socket);
