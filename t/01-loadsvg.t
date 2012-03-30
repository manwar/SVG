use strict;
use warnings;

use Test::More tests => 2;

use_ok ('SVG',"Use SVG");

my $svg = SVG->new;
isa_ok $svg, 'SVG';
