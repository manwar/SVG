use Test::More tests=>7;
use strict;
use SVG;

my $svg = new SVG;

my $tag = $svg->script( type => "text/ecmascript" );

# populate the script tag with cdata
# be careful to manage the javascript line ends.
# qq│text│ or qq§text§ where text is the script
# works well for this.

my $out;

$tag->CDATA(
    qq|
function d(){
//simple display function
for(cnt = 0; cnt < d.length; cnt++)
document.write(d[cnt]);//end for loop
document.write("<hr>");//write a line break
document.write('<br>');//write a horizontal rule
}|
);

ok($tag,"create script element");
$out = $svg->xmlify;

ok($out =~ /\"text\/ecmascript\"/,"specify script type");
ok($out =~ /function/,"generate script content");;
ok($out =~ /'<br>'/,"handle single quotes");
ok($out =~ /"<hr>/,"handle double quotes");

#test for adding scripting commands in an element

$out = $svg->xmlify;

my $rect = $svg->rect(
    x       => 10,
    y       => 10,
    fill    => 'red',
    stroke  => 'black',
    width   => '10',
    height  => '10',
    onclick => "alert('hello'+' '+'world')"
);

$out = $rect->xmlify;

ok( $out =~ /'hello'/gs && $out =~ /'world'/gsi,"mouse event script call" );


$svg = new SVG;
$svg->script()->CDATA("TESTTESTTEST");
$out = $svg->xmlify;
chomp $out;

ok( $out =~ /<script\s*><!\[CDATA\[TESTTESTTEST\]\]>\s*<\/script>/,"script without type");


