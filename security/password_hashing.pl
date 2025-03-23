#!/usr/bin/perl
# Hashing di password con bcrypt
# Licenza: BSD
use strict;
use warnings;
use Crypt::Eksblowfish::Bcrypt qw(bcrypt_hash en_base64);

my $password = 'SuperSecret!';
my $salt = en_base64(pack('H*', '123456789abcdef0'));
my $hashed = bcrypt_hash({ key_nul => 1, cost => 8, salt => $salt }, $password);
print "Hashed Password: $hashed\n";
