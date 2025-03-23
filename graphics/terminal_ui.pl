#!/usr/bin/perl
# Interfaccia utente testuale con Curses
# Licenza: BSD
use strict;
use warnings;
use Curses;

initscr();
addstr(5, 10, "Benvenuto nella TUI Perl!");
addstr(7, 10, "Premi qualsiasi tasto per uscire.");
refresh();
getch();
endwin();
