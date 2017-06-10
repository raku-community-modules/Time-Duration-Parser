#!/usr/bin/env perl6

use Time::Duration::Parser;

my $time-string = "5 days 4 hours 52 minutes 3 seconds";
my $x = Time::Duration::Parser.parse($time-string);
say "$time-string -> {$x.ast} seconds";



