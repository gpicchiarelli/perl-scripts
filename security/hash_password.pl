#!/usr/bin/perl
# Secure Password Hashing
# Licenza: BSD

use strict;
use warnings;
use Crypt::Eksblowfish::Bcrypt qw(bcrypt en_base64);

my $password = shift @ARGV or die "Uso: $0 <password>
";
my $salt = en_base64("random_salt");
my $hashed = bcrypt($password, '$2a$12$' . $salt);

print "Password hashed: $hashed
";
