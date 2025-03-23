#!/usr/bin/perl
# TCP Server Esempio
# Categoria: Networking
# Licenza: BSD

use strict;
use warnings;
use IO::Socket::INET;

my $server = IO::Socket::INET->new(
    LocalPort => 5000,
    Type      => SOCK_STREAM,
    Reuse     => 1,
    Listen    => 5
) or die "Non posso creare il server: $!";

print "Server in ascolto sulla porta 5000...
";

while(my $client = $server->accept()) {
    print $client "Benvenuto nel server TCP Perl!
";
    close($client);
}
