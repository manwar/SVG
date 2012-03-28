use Test::More tests=>9;
use strict;
use SVG qw(-inline 1);

# test: -inline

ok(my $svg1=new SVG(),"inline constructor");
$svg1->text->cdata("An inline document");

my $xml1a=$svg1->render();
ok($xml1a!~/DOCTYPE/,"1 render inline document");
ok($xml1a!~/^<\?xml .*?\?>\s*/sm);

my $xml1b=$svg1->render(-inline => 0);
ok($xml1b =~ /DOCTYPE/,"2 render not inline");
ok($xml1b =~ /^<\?xml .*?\?>\s*/sm);


my $svg2=new SVG(-inline => 0);

my $xml2a=$svg2->render();
ok($xml2a=~/DOCTYPE/,"3 render for not inline");
ok($xml2a=~/^<\?xml .*?\?>\s*/sm);

my $xml2b=$svg2->render(-inline => 1);
ok($xml2b!~/DOCTYPE/,"4 render inline render");
ok($xml2b!~/^<\?xml .*?\?>\s*/sm);
