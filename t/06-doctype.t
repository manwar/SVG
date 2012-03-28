use Test::More tests=>8;

use strict;
use SVG ();

# test: -sysid -pubid -docroot

my $svg=new SVG();
my $xml;

$svg->text->cdata("Document type declaration test");
ok($xml=$svg->dtddecl(),"dtd reclaration");

ok( $xml=~/DOCTYPE svg /,"doctype found");
ok($xml=~/ PUBLIC "-\/\/W3C\/\/DTD SVG 1.0\/\/EN" /,"PUBLIC found");
ok($xml=~/ "http:\/\/www.w3.org\/TR\/2001\/REC-SVG-20010904\/DTD\/svg10.dtd">/,"SVG 1.0 TR");

$svg=new SVG(-docroot => "mysvg");
$xml=$svg->dtddecl();
ok($xml=~/DOCTYPE mysvg /,"DOCTYPE mysvg");

$svg=new SVG(-pubid => "-//ROIT Systems/DTD MyCustomDTD 1.0//EN");
$xml=$svg->dtddecl();
ok( $xml=~/ PUBLIC "-\/\/ROIT Systems\/DTD MyCustomDTD 1\.0\/\/EN" /,"pubid 2");

$svg=new SVG(-pubid => undef);
$xml=$svg->dtddecl();
ok( $xml=~/ SYSTEM "http:\/\/www.w3.org\/TR\/2001\/REC-SVG-20010904\/DTD\/svg10.dtd">/,"pubid 3");

$svg=new SVG(-sysid => "http://www.perlsvg.com/svg/my_custom_svg10.dtd");
$xml=$svg->dtddecl();
ok($xml=~/ "http:\/\/www\.perlsvg\.com\/svg\/my_custom_svg10.dtd">/,"custom sysid");
