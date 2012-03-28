use Test::More tests=>4;
use strict;
use_ok('SVG',"call SVG once");
use_ok('SVG',"call SVG twice without warnings");
use_ok('SVG',"call SVG three times without warnings");
use_ok('SVG',"call SVG dont blow it away without warnings");
