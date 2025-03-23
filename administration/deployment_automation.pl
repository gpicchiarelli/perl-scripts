#!/usr/bin/perl
# Automazione deploy con Perl
# Licenza: BSD
use strict;
use warnings;

system('git pull origin master');
system('cp -r ./app /var/www/html/app');
print "Deploy eseguito correttamente.\n";
