#!/usr/bin/perl
# Interazione MySQL Esempio
# Categoria: Database
# Licenza: BSD

use strict;
use warnings;
use DBI;

my $dbh = DBI->connect('DBI:mysql:database=test;host=localhost', 'user', 'password', {'RaiseError' => 1});

my $sth = $dbh->prepare('SELECT VERSION()');
$sth->execute();

while (my @row = $sth->fetchrow_array()) {
    print "Versione MySQL: @row\n";
}

$dbh->disconnect();
