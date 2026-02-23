#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 7;

BEGIN {
    use_ok('SVG')            || print "Bail out!\n";
    use_ok('SVG::DOM')       || print "Bail out!\n";
    use_ok('SVG::Element')   || print "Bail out!\n";
    use_ok('SVG::Extension') || print "Bail out!\n";
    use_ok('SVG::XML')       || print "Bail out!\n";
}

eval 'use SVG (-indent => "  ")';
is $@, "";

eval 'use SVG (-qqrq => "  ")';
like $@, qr{^Unknown attribute '-qqrq' in import list};

diag("Testing SVG $SVG::VERSION, Perl $], $^X");
