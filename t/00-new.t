use strict;
use warnings;

use Test::More;

use SVG;

my $svg = SVG->new();
isa_ok( $svg, 'SVG' );

my $other = $svg->new;
isa_ok( $other, 'SVG' );

isnt $svg, $other;

# TODO: Do we really want to support the creation of an instance from another one?

# TODO: add more tests to check what happens if the original instance
# already had some content. eg. a circle.

done_testing();

