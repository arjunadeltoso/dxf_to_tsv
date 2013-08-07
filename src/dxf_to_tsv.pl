#!/usr/bin/perl

########################################
#
# dxf_to_tsv.pl
# Simple script to extract point data from
# a dxf file into a tab separated file.
# Usage: dxt_to_tsv.pl filename
# Output:
#
# first_point_val_1 first_point_val_2 first_point_val_3
# second_point_val_1 second_point_val_2 second_point_val_3
# ...
#
# Author: Arjuna Del Toso (http://arjuna.deltoso.net)
########################################

use warnings;
use strict;

if (scalar(@ARGV) != 1) {
    die("Usage: dxf_to_tsv.pl filename\n");
}

while (my $file = shift) {
    open(INPUT_FILE, $file)
	or die "Couldn't open $file";

    my $counter = 0;
    my $line = '';
    while (<INPUT_FILE>) {
	s/\R//g;
	if ($_ =~ m/^INSERT/ || $counter) {
	    $counter = $counter + 1;
	}

	if ($counter == 9 || $counter == 11) {
	    $line = $line . $_ . "\t";
	}
	
	if ($counter == 13) {
	    print $line . $_ . "\n";
	    $line = '';
	    $counter = 0;
	}
    }
    close(INPUT_FILE);
}
