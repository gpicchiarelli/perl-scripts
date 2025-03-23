#!/usr/bin/perl

use strict;
use warnings;
use Getopt::Long;

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

# Gestione delle opzioni della riga di comando
my $input_text = "";
my $morse_input = "";
my $dec = undef;
my $enc = undef;

GetOptions(
    'encode=s' => \$input_text,
    'decode=s' => \$morse_input,
) or warn "Uso: $0 --encode <testo> | --decode <morse>\n";

# Trimma gli spazi bianchi all'inizio e alla fine della stringa
$input_text =~ s/^\s+|\s+$//g;
$morse_input =~ s/^\s+|\s+$//g;

if (length($input_text) gt 0 ) {$enc = 1;}
if (length($morse_input) gt 0 ) {$dec = 1;}


# Verifica le opzioni ricevute e stampa di debug
print "Opzioni ricevute: encode='$input_text', decode='$morse_input'\n";
print "--encode è stato valorizzato: " . (defined $input_text ? "Sì ($input_text)" : "No") . "\n";
print "--decode è stato valorizzato: " . (defined $morse_input ? "Sì ($morse_input)" : "No") . "\n";

# Codifica o Decodifica a seconda delle opzioni
if ($enc) {
    print "Codificando il testo: $input_text\n";  # Debug
    my $encoded = encode_morse($input_text);
    print "Codificato in Morse: $encoded\n";
} elsif ($dec) {
    print "Decodificando il Morse: $morse_input\n";  # Debug
    my $decoded = decode_morse($morse_input);
    print "Decodificato in Testo: $decoded\n";
} else {
    die "Uso: $0 --encode <testo> | --decode <morse>\n";
}
