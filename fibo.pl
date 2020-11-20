#!/usr/bin/perl

use strict;
use warnings;

my@farr = (0,1);
my$cnt = $ARGV[0]; #how much numbers do you need

if($cnt !~ /^\d+$/){
	die "Please set how much Fibo numbers you need in app args.\n";
}

for (my $i = 2; $i < $cnt; $i++){
	$farr[$i] = $farr[$i-1] + $farr[$i-2];
	
	if ($farr[$i] == "inf"){
		last;
	}
}
print join (", ", @farr)."\n";
