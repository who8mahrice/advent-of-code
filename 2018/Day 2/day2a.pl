#!/usr/bin/perl 
use warnings;
use strict;
use diagnostics;
use feature 'say';
use v5.28;

my $fname = shift;

open my $fh, "<", $fname
    or die "Can't open $fname: $!";

my ($twos, $threes);

chomp(my @lines = <$fh>);

foreach my $line (@lines) {
	++$twos   if (hasrepeated($line, 2));
	++$threes if (hasrepeated($line, 3));
}

print "Two: $twos and Three: $threes\n";
say $twos * $threes;

sub hasrepeated {
	my ($str, $n) = @_;
	my $l;
	print "String is $str\n"; # comment this out if you dont want to see whats going on behind the scenes
	foreach $l (split //, $str) { # splits one char at a time
		print "Line has $l \n"; # comment this out if you dont want to see whats going on behind the scenes
		if ((() = $str =~ /$l/g) == $n) {
			my $whatisthis = $l;
			print "What is this: $whatisthis\n"; # comment this out if you dont want to see whats going on behind the scenes
			return 1;
		}
	}
	return 0;
}