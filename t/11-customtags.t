use strict;
use warnings;

use Test::More tests => 2;
use SVG qw(star planet moon);

my $svg = SVG->new;

ok(eval {
	$svg->star(id=>"Sol")->planet(id=>"Jupiter")->moon(id=>"Ganymede");
}, "defined custom tags");

ok(! eval {
		$svg->asteriod(id=>"Ceres");
	} ,"undefined custom tag");

