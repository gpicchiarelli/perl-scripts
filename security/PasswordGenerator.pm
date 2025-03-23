#test onliner: perl -I. -MPasswordGenerator=generate_password -E 'say generate_password(60)'
package PasswordGenerator;

use strict;
use warnings;
use Carp;
use Exporter 'import';
our @EXPORT_OK = ('generate_password');

sub generate_password {
    my ($length) = @_;
    
    # Imposta una lunghezza di default di 15 se non viene fornita una
    $length = 15 unless defined $length;

    # Verifica che la lunghezza sia un numero intero positivo
    croak "La lunghezza deve essere un intero positivo." unless $length =~ /^\d+$/ && $length > 0;

    # Definisce i caratteri possibili per la password
    my @chars = ('A'..'Z', 'a'..'z', '0'..'9', '!', '@', '#', '$', '%', '^', '&', '*');
    
    # Genera la password
    my $password = '';
    $password .= $chars[rand @chars] for 1 .. $length;

    return $password;
}

1;
