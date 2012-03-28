use Test::More tests => 2;
use strict;
use SVG;

my $svg=new SVG();
my $g=$svg->group(fill=>"white", stroke=>"black");

my $fill=$g->attribute("fill");
ok($fill eq "white","attribute (get)");

$g->attribute(stroke => "red");
my $stroke=$g->attribute("stroke");
ok($stroke eq "red","attribute (set)");

