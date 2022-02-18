grammar Time::Duration::Parser {
    token TOP { 
        | <hms>         { make $<hms>.made; }
        | <timespec>    { make $<timespec>.made; }
    }

    token hms { (\d+) ':' (\d\d) [ ':' (\d\d) ]? {
        make $0 * 60 * 60 + $1 * 60 + ($2//0);
    } }

    rule timespec { <time> *% <sep> {
        make [+] $<time>».made;
    } }

    rule time { <number> <duration> {
        make +$<number> * $<duration>.made;
    } }
    
    token duration {
        | [ s | seconds? | secs? ]     { make 1 }
        | [ m | minutes? | mins? ]     { make 60; }
        | [ h | hrs? | hours? ]        { make 60 * 60 }
        | [ d | days? ]                { make 60 * 60 * 24 }
        | [ w | weeks? ]               { make 60 * 60 * 24 * 7 }
        | [ M | months? | mo | mons? ] { make 60 * 60 * 24 * 30 }
        | [ y | years? ]               { make 60 * 60 * 24 * 365 }
    }

    token number { <[+-]>? \d+ ['.' \d*]?  }

    token sep { ',' | 'and' | <.ws> }
}

sub duration-to-seconds($string) is export {
    my $result := Time::Duration::Parser.parse($string);
    $result ?? $result.made !! Nil
}

=begin pod

=head1 NAME

Time::Duration::Parser - Parse duration strings into seconds

=head1 SYNOPSIS

=begin code :lang<raku>

use Time::Duration::Parser;

my $time-string = "5 days 4 hours 52 minutes 3 seconds";
my $s = duration-to-seconds($time-string);
say "$time-string -> $s seconds";

=end code

=head1 DESCRIPTION

Time::Duration::Parser is a module exports a single subroutine
C<duration-to-seconds> that turns a string like "3 days 29 minutes"
into a number of seconds.

Note, for B<months> and B<years> the values are approximated as 30 days
and 365 days respectively.

=head1 AUTHOR

Jonathan Scott Duff

Source can be located at: https://github.com/lizmat/Updown . Comments and
Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2017 Jonathan Scott Duff

Copyright 2018 - 2022 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
