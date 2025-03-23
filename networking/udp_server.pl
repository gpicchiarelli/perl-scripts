#!/usr/bin/perl
# Server UDP semplice
# Categoria: Networking
# Licenza: BSD
use strict;
use warnings;
use IO::Socket::INET;

my $socket = IO::Socket::INET->new(
    LocalPort => 5001,
    Proto     => 'udp'
) or die "Impossibile avviare server UDP: $!";

my $data;
$socket->recv($data, 1024);
print "Ricevuto: $data\n";
close($socket);
