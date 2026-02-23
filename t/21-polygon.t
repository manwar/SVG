use strict;
use warnings;

use Test::More tests => 8;

use SVG;

# test: style

my $svg  = SVG->new;
my $defs = $svg->defs();

diag 'a five-sided polygon';
my $xv = [ 0, 2, 4, 5, 1 ];
my $yv = [ 0, 0, 2, 7, 5 ];

my $points = $svg->get_path(
    x     => $xv,
    y     => $yv,
    -type => 'polygon'
);

# diag explain  $points;
is_deeply $points, { 'points' => '0,0 2,0 4,2 5,7 1,5 ' };

my $c = $svg->polygon(
    %$points,
    id    => 'pgon1',
    style => {
        fill   => 'red',
        stroke => 'green',
    },
    opacity => 0.6,
);

ok( $c, "polygon 1: define" );
isa_ok $c, 'SVG::Element';

my $out = $svg->xmlify();

#diag $out;

like( $out, qr/polygon/,  "polygon 2: serialize" );
like( $out, qr/style/,    "inline css style 1" );
like( $out, qr/opacity/,  "inline css style 2" );
like( $out, qr{<defs />}, "defs section" );
like( $out,
    qr{<polygon id="pgon1" opacity="0.6" points="0,0 2,0 4,2 5,7 1,5 " style="fill: red; stroke: green" />}
);

