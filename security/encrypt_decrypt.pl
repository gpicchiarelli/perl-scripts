#!/usr/bin/perl
# Crittografia/Decrittografia semplice AES
# Categoria: Sicurezza
# Licenza: BSD

use strict;
use warnings;
use Crypt::CBC;

my $key = 'chiave_segreta';
my $cipher = Crypt::CBC->new(-key => $key, -cipher => 'AES');

my $plaintext = "Testo segreto";
my $encrypted = $cipher->encrypt_hex($plaintext);
print "Testo criptato: $encrypted\n";

my $decrypted = $cipher->decrypt_hex($encrypted);
print "Testo originale: $decrypted\n";
