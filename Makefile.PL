use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'SVG',
    VERSION_FROM      => 'lib/SVG.pm', # finds $VERSION
    PREREQ_PM         => {
        'parent'       => 0,
        'Scalar::Util' => 0,
     },
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/SVG/Manual.pm', # retrieve abstract from module
       LICENSE        => 'perl',
       AUTHOR         => 'Ronan Oger <ronan@cpan.com>') : ()),
    META_MERGE        => {
       resources => {
           repository  =>  'https://github.com/szabgab/SVG',
       },
    },
);
