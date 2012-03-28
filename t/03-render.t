use Test::More tests=>3;
use strict;
use SVG;

my $svg=new SVG;
ok($svg->circle(),"add circle");
ok(my $output=$svg->render(),"render");
ok($output,"nonempty output");

