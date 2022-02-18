[![Actions Status](https://github.com/raku-community-modules/Time-Duration-Parser/workflows/test/badge.svg)](https://github.com/raku-community-modules/Time-Duration-Parser/actions)

NAME
====

Time::Duration::Parser - Parse duration strings into seconds

SYNOPSIS
========

```raku
use Time::Duration::Parser;

my $time-string = "5 days 4 hours 52 minutes 3 seconds";
my $s = duration-to-seconds($time-string);
say "$time-string -> $s seconds";
```

DESCRIPTION
===========

Time::Duration::Parser is a module exports a single subroutine `duration-to-seconds` that turns a string like "3 days 29 minutes" into a number of seconds.

Note, for **months** and **years** the values are approximated as 30 days and 365 days respectively.

AUTHOR
======

Jonathan Scott Duff

Source can be located at: https://github.com/raku-community-modules/Time-Duration-Parser . Comments and Pull Requests are welcome.

COPYRIGHT AND LICENSE
=====================

Copyright 2017 Jonathan Scott Duff

Copyright 2018 - 2022 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

