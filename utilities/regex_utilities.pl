#!/usr/bin/perl
# Validazione email con regex
# Licenza: BSD
use strict;
use warnings;

my $email = 'utente@example.com';
if ($email =~ /^[\w.-]+@[\w.-]+\.\w{2,4}$/) {
    print "Email valida!\n";
} else {
    print "Email non valida!\n";
}
