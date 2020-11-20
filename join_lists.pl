#!/usr/bin/perl

use strict;
use warnings;

my @list1 = ("a", "b", "c");
my @list2 = ("1", "2", "3", 4, 5);

my @newlist= ();

if(scalar(@list1) >= scalar(@list2)){
	for(my $i = 0; $i < scalar(@list1); $i++){
		push (@newlist, $list1[$i]);
		if($list2[$i]){
			push (@newlist, $list2[$i]);
		}
	}

}
else{ 
	for(my $g = 0; $g < scalar(@list2); $g++){
		push (@newlist, $list2[$g]);

		if($list1[$g]){
			push (@newlist, $list1[$g]);
		}
	}
}

print join (", ",@newlist);
