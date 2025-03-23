#!/usr/bin/perl
# Backup automatico di directory importanti
# Licenza: BSD
use strict;
use warnings;
use File::Copy::Recursive qw(dircopy);
use POSIX qw(strftime);

my $source = '/home/utente/documenti';
my $dest = '/home/utente/backup_' . strftime("%Y%m%d", localtime);

dircopy($source, $dest) or die "Backup fallito: $!";
print "Backup completato in $dest\n";
