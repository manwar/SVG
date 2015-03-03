#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

eval "use Test::Code::TidyAll";
plan skip_all => "Test::Code::TidyAll required for testing tidyness"
    if $@;

tidyall_ok();
