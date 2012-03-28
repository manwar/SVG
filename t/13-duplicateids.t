use Test::More tests => 2;
use strict;
use SVG;

# test: duplicate ids, -raiseerror

my $svga=new SVG();
my $dupnotdetected=eval {
    $svga->group(id=>'the_group');
    $svga->group(id=>'the_group');
    1;
};

ok(!$dupnotdetected,"raiseerror");

my $svgb=new SVG(-raiseerror => 0, -printerror => 0);
$svgb->group(id=>'the_group');
$svgb->group(id=>'the_group');
my $xml=$svgb->render();
ok($xml=~/errors=/,"raiseerror and printerror attribute in constructor");
