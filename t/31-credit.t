use strict;
use warnings;

use Test::More;
use SVG;

{
    diag "Include credits by default";
    my $svg = SVG->new();
    my $xml = $svg->render();
    like $xml, qr{by Ronan Oger};
}

{
    diag "We can hide the credits";
    my $svg = SVG->new( -nocredits => 1 );
    my $xml = $svg->render();
    unlike $xml, qr{by Ronan Oger};
}

done_testing;
