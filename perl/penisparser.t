#!/usr/bin/perl

use strict;

use Test::More;

my $out = qx'./penisparser.pl testfile';
my $expected = <<EOS;
penis penis penis penis penis.
penis, penis'penis penis penis.

penis.
EOS

is($out, $expected, 'Try penisparser.pl on testfile');
done_testing();
