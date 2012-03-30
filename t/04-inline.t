use Test::More tests => 10;
use strict;
use SVG qw(-inline 1);

# test: -inline

my $svg1 = SVG->new();
isa_ok $svg1, 'SVG';
isa_ok $svg1->text->cdata("An inline document"), 'SVG::Element';

my $xml1a = $svg1->render();
unlike $xml1a, qr/DOCTYPE/, "1 render inline document";
unlike $xml1a, qr/^<\?xml .*?\?>\s*/sm;

my $xml1b = $svg1->render(-inline => 0);
like $xml1b, qr/DOCTYPE/, "2 render not inline";
like $xml1b, qr/^<\?xml .*?\?>\s*/sm;


my $svg2 = SVG->new(-inline => 0);

my $xml2a = $svg2->render();
like $xml2a, qr/DOCTYPE/, "3 render for not inline";
like $xml2a, qr/^<\?xml .*?\?>\s*/sm;

my $xml2b = $svg2->render(-inline => 1);
unlike $xml2b, qr/DOCTYPE/, "4 render inline render";
unlike $xml2b, qr/^<\?xml .*?\?>\s*/sm;
