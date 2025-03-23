#!/usr/bin/perl
# Connessione HTTPS con SSL
# Licenza: BSD
use strict;
use warnings;
use LWP::UserAgent;

my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
my $response = $ua->get('https://example.com');
die $response->status_line unless $response->is_success;
print $response->decoded_content;
