#!/usr/bin/perl
# Connessione e query PostgreSQL
# Licenza: BSD
use strict;
use warnings;
use DBI;

my $dbh = DBI->connect("dbi:Pg:dbname=testdb;host=localhost", "user", "password", { RaiseError => 1 });

my $sth = $dbh->prepare("SELECT version()");
$sth->execute();

my @row = $sth->fetchrow_array;
print "PostgreSQL Version: $row[0]\n";

$dbh->disconnect;
