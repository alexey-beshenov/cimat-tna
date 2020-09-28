#!/usr/bin/perl

use warnings;
use strict;

my $del = 5;

my %stats;
my $prime_count = 0;
my $record_count = 0;
my @dec_types;

while (<>) {
    if (m/^# Field:/) {
	next;
    }
    if (m/^# Decomposition types: (.*)$/) {
	@dec_types = split /;\s*/, $1;

	for my $t (@dec_types) {
	    $stats{$t} = 0;
	}
	next;
    }
    
    if (m/^\d+\t(.*)$/) {
	$stats{$1}++;
	$prime_count++;

	if ($prime_count % $del == 0) {
	    for my $t (@dec_types) {
	        printf "%d\t\"%s\"\t%.6f\n", $record_count, $t, $stats{$t}/$prime_count;
		$record_count++;
	    }
	    printf "\n\n";
	}
    }
}

