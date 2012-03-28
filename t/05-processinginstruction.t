use Test::More tests=>9;
use strict;
use SVG;

my $svg=new SVG(width=>100,height=>100);
my $xml;

ok(my $pi = $svg->pi("Hello world","I am a PI"),"PI: add 2 arbitrary processing instructions");
ok($svg->rect(x=>0,y=>0,width=>10,height=>10,fill=>'red',stroke=>'brick'),"add a drawing element");
$svg->rect(x=>0,y=>0,width=>10,height=>10,fill=>'red',stroke=>'brick');
$svg->rect(x=>0,y=>0,width=>10,height=>10,fill=>'red',stroke=>'brick');
$svg->rect(x=>0,y=>0,width=>10,height=>10,fill=>'red',stroke=>'brick');
$svg->rect(x=>0,y=>0,width=>10,height=>10,fill=>'red',stroke=>'brick');
$svg->rect(x=>0,y=>0,width=>10,height=>10,fill=>'red',stroke=>'brick');
$svg->rect(x=>0,y=>0,width=>10,height=>10,fill=>'red',stroke=>'brick');
ok($xml = $svg->xmlify(),"serialize the svg");
ok($xml=~/<\?Hello\sworld\?>/gs, "serialize arbitrary processing instruction 1");
ok($xml=~/<\?I\sam\sa\sPI\?>/gs, "serialize arbitrary processing instruction 2");


ok($xml=~/rect/gsi,"PI 2: add non-PI elements");
ok(scalar @{$svg->pi} ==  2,"PI 3 - fetch PI array");

$svg->pi("Third PI entry");
$xml = $svg->xmlify();
ok($xml=~/<\?Third\sPI\sentry\?>/gsi,"pi 2");
ok(scalar @{$svg->pi} ==  3,"PI 3");
