use Test::More tests=>1;
use strict;
use SVG;

my $svg=new SVG(-extension => "<!ENTITY % myentity \"myvalue\">");
$svg->group->text->cdata("Extensions");
my $xml=$svg->render;

    ok($xml=~/[\n<!ENTITY % myentity "myvalue">\n]>/,"ENTITY myentity myvalue");
