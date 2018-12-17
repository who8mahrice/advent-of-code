#!/usr/bin/perl 
use warnings;
use strict;
use diagnostics;
use feature 'say';
use v5.28;

my $fname = shift;

open my $fh, "<", $fname
    or die "Can't open $fname: $!";

chomp(my @lines = <$fh>);

foreach my $idx1 (0 .. $#lines-1) {
	print "idx1 is : $idx1\n";
	foreach my $idx2 ($idx1+1 .. $#lines) {
		print "idx2 is : $idx2\n";
		compare($lines[$idx1], $lines[$idx2]);
	}
}

sub compare {
	my ($l1, $l2) = @_;
	print "\$l1 is: $l1 and \$l2 is: $l2\n";
	my $count = 0;
	my $common;
	foreach my $idx (0 .. length($l1)-1) {
		if (substr($l1, $idx, 1) ne substr($l2, $idx, 1)) {
			++$count;
			print "The current missed count is: $count\n";
		}
		else {
			$common .= substr($l1, $idx, 1); # if there is a match
		}
	}
	if ($count == 1) {
		say $common;
		exit;
	}
	return;
}