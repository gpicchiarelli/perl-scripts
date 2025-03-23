#!/usr/bin/perl
# Simple TCP Client
# Licenza: BSD

use strict;
use warnings;
use IO::Socket::INET;

my $socket = IO::Socket::INET->new(
    PeerAddr => '127.0.0.1',
    PeerPort => '5000',
    Proto    => 'tcp'
) or die "Connessione fallita: $!
";

print $socket "Hello Server!
";
shutdown($socket, 1);

while(<$socket>) {
    print $_;
}
close($socket);
