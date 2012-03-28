use Test::More tests => 2;
use strict;
use SVG;

# test: style

my $svg  = new SVG;
my $defs = $svg->defs();
my $out;

$out = $svg->xmlify();

ok($out =~ /xmlns:xlink=\"http:\/\/www.w3.org\/1999\/xlink"/,"xlink definition in svg - part 1");
ok($out =~ /xmlns=\"http:\/\/www.w3.org\/2000\/svg"/,"xlink definition in svg - part 2");
