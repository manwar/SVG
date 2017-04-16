#!/usr/bin/perl

use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'SVG',
    VERSION_FROM  => 'lib/SVG.pm',
    PREREQ_PM     => {
        'parent'       => 0,
        'Scalar::Util' => 0,
    },
    ($] >= 5.005 ?
     (ABSTRACT_FROM  => 'lib/SVG.pm',
      LICENSE        => 'perl',
      AUTHOR         => 'Ronan Oger <ronan@cpan.com>') : ()),
    META_MERGE       => {
        resources => {
            type  => 'git',
            url   => 'https://github.com/manwar/SVG.git',
            web   => 'https://github.com/manwar/SVG',
        },
        x_contributors => [
            'Peter Wainwright',
            'Ian Hickson',
            'Adam Schneider',
            'Steve Lihn',
            'Allen Day',
            'Gabor Szabo',
            'Mohammad S Anwar',
        ],
    },
);
