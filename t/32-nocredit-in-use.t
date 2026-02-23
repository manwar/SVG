use strict;
use warnings;

use Test::More;
use SVG qw(-nocredits 1);

{
    diag "no credits by default";
    my $svg = SVG->new();
    my $xml = $svg->render();
    unlike $xml, qr{by Ronan Oger};
}

{
    diag "we can turn on credits";
    my $svg = SVG->new( -nocredits => 0 );
    my $xml = $svg->render();
    like $xml, qr{by Ronan Oger};
}

done_testing;
