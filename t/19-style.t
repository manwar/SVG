use Test::More tests => 1;
use strict;
use SVG;

# test: style

my $svg=new SVG;
my $defs = $svg->defs();
my $rect = $svg->rect(x=>10,y=>10,
	width=>10,height=>10,
	style=>{fill=>'red',stroke=>'green'});
my $out = $svg->xmlify;
ok($out =~ /stroke\s*\:\s*green/,"inline css defs");
