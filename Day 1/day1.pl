#!/usr/bin/perl 
use warnings;
use strict;
use diagnostics;
use feature 'say';
use v5.28;

my $filename = 'nums.txt';
my $sum = 0;
my $nums;
open(my $fh, '<:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";
 
while (my $num = <$fh>) {
  $sum+=$num;
  #chomp $row;
  #print "$num\n";
}

print "The total is $sum\n";