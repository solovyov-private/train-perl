#!/usr/bin/perl

use strict;
use warnings;

my@arr = (@ARGV);
my$maxlength = 0;

#checks and
#get maximum of digits in the biggest number - $maxlength
if(scalar(@arr) == 0){
	die "No arguments defined, nothing to calculate...\n";
}

for(my$i=0; $i<scalar(@arr); $i++){
	if($arr[$i] !~ /^\d+$/){
		die "Error: $arr[$i] is not a positive integer. Please use only positive integers\n";
	} 
	
	if($maxlength < length($arr[$i])){
		$maxlength = length($arr[$i]);	
	}
}

#convert every number to $maxlength length, by repeating its existing part
my@arrtmp = ();

for (my $z=0; $z < scalar(@arr); $z++){
	my $tmpval = $arr[$z];

	#while it's shorter than $maxlength, concatenate part of it
	for (my $g = length($arr[$z]); $g < $maxlength; $g++){
		$tmpval = $tmpval.substr($arr[$z],0,($maxlength-length($tmpval)));
	}
	#create list of vals 'new number'*'old number
	push (@arrtmp, ($tmpval."*".$arr[$z]));
}

#sort values desc
my @sortedarr= sort {$b cmp $a} @arrtmp;

#remove first part of the values in a list
for (my$x =0; $x < scalar(@sortedarr); $x++){
	$sortedarr[$x] =~ s/^\d+\*//;
}

print "Max number can be formed from these: ".join("", @sortedarr)."\n";
