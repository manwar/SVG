use Test::More tests => 4;

use strict;
use SVG;

# test: style

my $svg=new SVG;
my $defs = $svg->defs();
my $out;
# a five-sided polygon
my $xv = [0,2,4,5,1];
my $yv = [0,0,2,7,5];

my $points = $svg->get_path(
        x=>$xv, y=>$yv,
        -type=>'polygon'
    );

my $c = $svg->polygon(
        %$points,
        id=>'pgon1',
        style=>{fill=>'red',stroke=>'green'},
	opacity=>0.6,
);

ok($c,"polygon 1: define");

$out = $svg->xmlify();

ok($out =~ /polygon/,"polygon 2: serialize");

ok($out =~ /style/,"inline css style 1");

ok($out =~ /opacity/,"inline css style 2");
