#!/usr/bin/perl
# Trasferimento file sicuro con Net::SFTP
# Licenza: BSD
use strict;
use warnings;
use Net::SFTP;

my $sftp = Net::SFTP->new('example.com', user => 'utente', password => 'password');
$sftp->put('file_locale.txt', '/remoto/file.txt') or die "Errore: ".$sftp->error;
print "File trasferito correttamente.\n";
