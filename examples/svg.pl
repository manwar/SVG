#!/usr/bin/perl -w

use strict;

BEGIN {
  push @INC , '../';  
  push @INC , '../SVG';
}

use SVG;

# create an SVG object
my $svg= SVG->new(width=>200,height=>200);
$svg->title()->cdata('I am a title');
# use explicit element constructor to generate a group element
my $y=$svg->group(
    id    => 'group_y',
    style => { stroke=>'red', fill=>'green' }
);
$y->circle(cx=>100, cy=>100, r=>50, id=>'circle_in_group_y');
# add a circle to the group
$y->circle(cx=>100, cy=>100, r=>50, id=>'circle_in_group_y');
$y->comment('This is a comment');
$y->circle(cx=>100, cy=>100, r=>50, id=>'circle_in_group_y');

# now render the SVG object, implicitly use svg namespace
print $svg->xmlify;