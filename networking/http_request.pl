#!/usr/bin/perl
# Esecuzione richiesta HTTP
# Licenza: BSD
use strict;
use warnings;
use HTTP::Tiny;

my $response = HTTP::Tiny->new->get('http://httpbin.org/get');
if ($response->{success}) {
    print "$response->{content}\n";
} else {
    die "Errore: $response->{status} $response->{reason}\n";
}
