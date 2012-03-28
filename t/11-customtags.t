use Test::More tests => 2;
use strict;
use SVG qw(star planet moon);

my $svg=new SVG;

ok(eval {
	$svg->star(id=>"Sol")->planet(id=>"Jupiter")->moon(id=>"Ganymede");
},"defined custom tags");

ok(! eval {
		$svg->asteriod(id=>"Ceres");
	} ,"undefined custom tag");
