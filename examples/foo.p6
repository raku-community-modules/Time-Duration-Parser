#!/usr/bin/env perl6

use lib BEGIN { callframe(0).annotations<file>.IO.parent.parent.child("lib").Str; };
use Time::Duration::Parser;

my @ts = (
    '1 s',
    '1.9 s',
    '2 sec',
    '3 s',
    '4 sec',
    '5 secs',
    '6 second',
    '7 seconds',
    '1.5 min',
    '1.51231 min',
    '5 minutes',
    '5 min 15 sec',
    '5 minutes 53 seconds',
    '5:23',
    '5:23:15',
    '135:23:15',
);

for @ts -> $t {
    my $x = Time::Duration::Parser.parse($t);
    next unless $x;
    say "$t -> {$x.ast}";
}
