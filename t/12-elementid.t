use Test::More tests => 2;
use strict;
use SVG;

my $svg=new SVG();
my $group=$svg->group(id=>'the_group');

ok($group->getElementID() eq "the_group","getElementID");
ok($svg->getElementByID("the_group") == $group,"getElementByID");
