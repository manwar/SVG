use Test::More tests => 2;
use strict;

use_ok ('SVG',"Use SVG");

my $svg = SVG->new;
isa_ok $svg, 'SVG';
