use Test::More tests=>18;
use strict;
use SVG;

# test: getFirstChild, getLastChild, getParent, getChildren

my $svg    = new SVG;
my $parent = $svg->group();
my $child1 = $parent->text->cdata("I am the first child");
my $child2 = $parent->text->cdata("I am the second child");
my $child3 = $parent->text->cdata("I am the third child");

ok($parent->getFirstChild() == $child1,"getFirstChild");
ok($child1->getParent() == $parent,"getParent 1");
ok($parent->getLastChild() == $child3,"getLastChild");
ok($child2->getParent() == $parent,"getParent 2");
ok($parent->hasChildren(),"hasChildren");
my @children = $parent->getChildren();
ok(scalar(@children) == 3,"correct number of children");
ok($children[0] == $child1,"getChildren 1");
ok($children[1] == $child2,"getChildren 2");
ok($children[2] == $child3,"getChildren 3");


is($parent->removeChild($child1), $child1, 'removeChild1');
is($parent->removeChild($child3), $child3, 'removeChild3');
is($parent->removeChild($child2), $child2, 'removeChild2');
is($parent->removeChild($child1), 0, 'no such child');
is($parent->findChildIndex($child1), -1, 'child1 is gone');

is($parent->insertAtIndex($child1,0), 1);
is($parent->findChildIndex($child1), 0, 'child1 is back');
is($parent->removeAtIndex(0), $child1);
is($parent->findChildIndex($child1), -1, 'child1 is gone again');
