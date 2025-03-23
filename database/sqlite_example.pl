#!/usr/bin/perl
# SQLite Database Interaction Example
# Licenza: BSD

use strict;
use warnings;
use DBI;

my $dbh = DBI->connect("dbi:SQLite:dbname=test.db","","") or die $DBI::errstr;

$dbh->do("CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT)");
$dbh->do("INSERT INTO users (name) VALUES ('Mario Rossi')");

my $sth = $dbh->prepare("SELECT * FROM users");
$sth->execute();

while (my @row = $sth->fetchrow_array()) {
    print "ID: $row[0], Name: $row[1]
";
}

$dbh->disconnect();
