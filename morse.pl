#!/usr/bin/perl

use strict;
use warnings;

# Dizionario Morse
my %morse_code = (
    'A' => '.-',   'B' => '-...', 'C' => '-.-.', 'D' => '-..',  'E' => '.',
    'F' => '..-.', 'G' => '--.',  'H' => '....', 'I' => '..',   'J' => '.---',
    'K' => '-.-',  'L' => '.-..', 'M' => '--',   'N' => '-.',   'O' => '---',
    'P' => '.--.', 'Q' => '--.-', 'R' => '.-.',  'S' => '...',  'T' => '-',
    'U' => '..-',  'V' => '...-', 'W' => '.--',  'X' => '-..-', 'Y' => '-.--',
    'Z' => '--..',
    '1' => '.----','2' => '..---','3' => '...--','4' => '....-','5' => '.....',
    '6' => '-....','7' => '--...','8' => '---..','9' => '----.','0' => '-----',
    ' ' => '/',    '.' => '.-.-.-', ',' => '--..--', '?' => '..--..',
    '!' => '-.-.--', '@' => '.--.-.', '&' => '.-...', ':' => '---...',
    ';' => '-.-.-.', '=' => '-...-', '+' => '.-.-.', '-' => '-....-',
    '_' => '..--.-', '(' => '-.--.', ')' => '-.--.-', '/' => '-..-.'
);

# Inverti il dizionario per la decodifica
my %inverse_morse = reverse %morse_code;

# Codifica Testo in Morse
sub encode_morse {
    my ($text) = @_;
    $text = uc($text);  # Converti tutto in maiuscolo
    my @encoded;
    foreach my $char (split //, $text) {
        if (exists $morse_code{$char}) {
            push @encoded, $morse_code{$char};
        } else {
            push @encoded, '?';  # Carattere sconosciuto
        }
    }
    return join ' ', @encoded;
}

# Decodifica Morse in Testo
sub decode_morse {
    my ($morse) = @_;
    my @decoded;
    foreach my $code (split / /, $morse) {
        if (exists $inverse_morse{$code}) {
            push @decoded, lc($inverse_morse{$code});  # Lettere decodificate in minuscolo
        } elsif ($code eq '/') {
            push @decoded, ' ';  # Spazio tra parole
        } else {
            push @decoded, '?';  # Codice non riconosciuto
        }
    }
    return join '', @decoded;
}

# Test dello script
print "Inserisci il testo da codificare in Morse: ";
my $input = <STDIN>;
chomp($input);
my $encoded = encode_morse($input);
print "Codificato in Morse: $encoded\n";

print "\nInserisci il codice Morse da decodificare: ";
my $morse_input = <STDIN>;
chomp($morse_input);
my $decoded = decode_morse($morse_input);
print "Decodificato in Testo: $decoded\n";
