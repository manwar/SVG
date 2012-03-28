#!/usr/bin/perl -w

use strict;


BEGIN {
  push @INC , '../';  
  push @INC , '../SVG';
}

use SVG;

# create an SVG object
my $svg= SVG->new(width=>100,height=>100);
$svg->pi('we are surround you','surrender all your bases');
$svg->comment('I am a comment','and another comment');
$svg->circle(cx=>100, cy=>100, r=>50, id=>'circle_in_group_y');
# now render the SVG object, implicitly use svg namespace

print "Content-type: image/svg+xml\n\n";

print $svg->xmlify(-dtd=>'http://this-is-my-dtd.html.hereIam');