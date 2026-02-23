use strict;
use warnings;
use Test::More;

# This is the critical test - 'use SVG ()' suppresses import(),
# which previously caused all element methods to be unavailable.
use SVG ();

my $svg = SVG->new( width => 100, height => 100 );
isa_ok( $svg, 'SVG', 'SVG object created with use SVG ()' );

# Test a selection of element methods that rely on autoload predeclaration
for my $method (qw(circle ellipse rect path polygon polyline line title desc))
{
    ok( SVG::Element->can($method), "$method is available with use SVG ()" );
}

done_testing;
