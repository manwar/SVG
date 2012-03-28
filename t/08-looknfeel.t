use Test::More tests=> 2;
use strict;
use SVG (-indent => '*', -elsep => '|', -nocredits => 1);

# test: -indent -elsep -nocredits

my $svg=new SVG();
$svg->group->text->cdata("Look and Feel");
my $xml=$svg->render();

ok($xml=~/\n/ or$xml=~/\|/,"correct element separation");
ok($xml=~/\*\*/ , "correct indent string");
