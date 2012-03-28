use Test::More tests => 3;
use strict;
use SVG;

# test: getFirstChild, getLastChild, getParent, getChildren

my $svg=new SVG;
my $parent=$svg->group();
my $child1=$parent->text->cdata("I am the first child");
my $child2=$parent->text->cdata("I am the second child");

ok($child1->hasSiblings(),"hasSiblings");
ok($child1->getNextSibling() == $child2,"getNextSibling");
ok($child2->getPreviousSibling() == $child1,"getPreviousSibling");

