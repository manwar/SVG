use Test::More tests => 4;
use strict;
use SVG;

# test: getElementTypes, getElementsByType, getElementType, getElementsByType, getElementTypes

my $svg=new SVG;
my $parent=$svg->group();
my $child1=$parent->text->cdata("I am the first child");
my $child2=$parent->text->cdata("I am the second child");

ok($child1->getElementType() eq "text","getElementType");
ok(scalar(@{$svg->getElementsByType("g")})==1,"getElementsByType test 1");
ok(scalar(@{$svg->getElementsByType("text")})==2,"getElementsByType test 2");
ok(scalar(@{$svg->getElementTypes()})==3,"getElementTypes");
