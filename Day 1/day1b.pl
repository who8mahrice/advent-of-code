#!/usr/bin/perl 
use warnings;
use strict;
use diagnostics;
use feature 'say';
use v5.28;

my $filename = 'nums.txt';
my $sum = 0;
my %seen;
my $seened = \%seen;

while(1){ # comment this line out 
	open my $fh, "<", $filename
		or die "Can't open $filename: $!";
	while (my $line = <$fh>) {
		$sum += $line;
		$seen{$sum}++;
		if ($seen{$sum} == 2) {
			foreach my $key ( keys %$seened ) { 
   				print $key, " => ", $seened->{$key},"\n";
			}
			say "The answer is: $sum";
			exit;
		}
	}
	# add close $fh in here to get the answer, if you add it in here the foreach stuff will not be able to print below
	close $fh;
}




=begin
# Just prints the answer...

my $fname = shift;

my $sum;
my %seen;
while (1) {
	open my $fh, "<", $fname
		or die "Can't open $fname: $!";
	while (my $line = <$fh>) {
		$sum += $line;
		$seen{$sum}++;
		if ($seen{$sum} == 2) {
			say $sum;
			exit;
		}
	}
	close $fh;
}
=cut