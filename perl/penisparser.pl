#!/usr/bin/perl

use strict;

my $file = shift;

if (not $file)
{
    print "Usage: $0 file\n";
    exit 1;
}

open my $f, '<', $file or die "Can not open $file: $!\n";

undef $/;
(my $content = <$f>) =~ s/\w+/penis/g;
print $content;
