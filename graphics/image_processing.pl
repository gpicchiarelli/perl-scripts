#!/usr/bin/perl
# Ridimensionamento immagini con PerlMagick
# Licenza: BSD
use strict;
use warnings;
use Image::Magick;

my $img = Image::Magick->new;
$img->Read('input.jpg');
$img->Resize(geometry => '200x200');
$img->Write('output_resized.jpg');
print "Immagine ridimensionata salvata come output_resized.jpg\n";
