use strict;
use warnings;
use Term::ANSIColor;
use Audio::DSP;
use Time::HiRes qw(usleep);

# Installa i moduli necessari automaticamente
use CPAN;
my @modules = qw(Term::ANSIColor Audio::Analyzer Time::HiRes);
foreach my $module (@modules) {
    eval "use $module";
    if ($@) {
        print "Installazione del modulo $module in corso...\n";
        CPAN::Shell->install($module);
        eval "use $module";
        die "Impossibile installare il modulo $module" if $@;
    }
}

# Frequenze standard per le corde della chitarra
my %notes = (
    'E2' => 82.41,
    'A2' => 110.00,
    'D3' => 146.83,
    'G3' => 196.00,
    'B3' => 246.94,
    'E4' => 329.63
);

# Intervallo accettabile per considerare una corda accordata (Hz)
my $tolerance = 1.0;

# Inizializza l'interfaccia audio
#my $analyzer = Audio::Analyzer->new(
#    source => 'default',   # Sostituisci con il microfono specifico, se necessario
#    format => 'wav',
#    rate   => 44100,
#    bits   => 16,
#    channels => 1
#);

($buf, $chan, $fmt, $rate) = (4096, 1, 8, 8192);
$dsp = new Audio::DSP(buffer   => $buf,
                      channels => $chan,
                      format   => $fmt,
                      rate     => $rate);
                      
$seconds = 5;
$length  = ($chan * $fmt * $rate * $seconds) / 8;

print color('bold green');
print "\nBenvenuto nell'Accordatore per Chitarra!\n";
print color('reset');
$capture->start;
print "Suona una corda e aspetta il risultato...\n";

# Record 5 seconds of sound
for (my $i = 0; $i < $length; $i += $buf) {
    $dsp->read() || die $dsp->errstr();
}
# Play it back
for (;;) {
    $dsp->write() || last;
}
$dsp->close();

while (1) {
  my $buffer = $capture->read(1024);

    if (!$buffer) {
        print color('red');
        print "Errore: Impossibile leggere l'audio.\n";
        print color('reset');
        last;
    }

    my $freq = $analyzer->get_dominant_frequency($buffer);

    if ($freq) {
        my $closest_note;
        my $closest_diff = 1e6;

        foreach my $note (keys %notes) {
            my $diff = abs($freq - $notes{$note});
            if ($diff < $closest_diff) {
                $closest_diff = $diff;
                $closest_note = $note;
            }
        }

        print "\nNota rilevata: $closest_note ($notes{$closest_note} Hz)\n";
        print "Frequenza rilevata: $freq Hz\n";

        if ($closest_diff <= $tolerance) {
            print color('bold green');
            print "Accordata!\n";
            print color('reset');
        } elsif ($freq < $notes{$closest_note}) {
            print color('bold yellow');
            print "Troppo bassa, stringi la corda.\n";
            print color('reset');
        } else {
            print color('bold yellow');
            print "Troppo alta, allenta la corda.\n";
            print color('reset');
        }
    } else {
        print "Nessuna frequenza rilevata, prova di nuovo.\n";
    }

    usleep(500000);  # Aspetta 500 ms prima di rilevare di nuovo
}
$capture->stop;
print "Ascolto terminato.\n";

