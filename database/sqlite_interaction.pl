#!/usr/bin/perl
# Esempio SQLite reale
# Licenza: BSD
use strict;
use warnings;
use DBI;

my $dbh = DBI->connect("dbi:SQLite:dbname=test.db","","") or die $DBI::errstr;
$dbh->do("CREATE TABLE IF NOT EXISTS persone (nome TEXT, età INTEGER)");
$dbh->do("INSERT INTO persone VALUES ('Giulia', 29)");

my $sth = $dbh->prepare("SELECT * FROM persone");
$sth->execute();
while(my @row = $sth->fetchrow_array) {
    print "Nome: $row[0], Età: $row[1]\n";
}
$dbh->disconnect();
