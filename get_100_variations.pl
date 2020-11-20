#!/usr/bin/perl

use strict;
use warnings;

my(@data) = (1,' ',2,' ',3,' ',4,' ',5,' ',6,' ',7,' ',8,' ',9);
my($res) = 100;
my(@ops) = ('+', '-', ' ');
my(@resultsarr);

&calc(1,@data);

#===========output=====================
#
my %tmp=();	
@resultsarr = grep {! $tmp{$_}++ } @resultsarr;
print join("", @resultsarr);


#==========calc function===============
#
sub calc{

my($p,@dtemp) = @_;
my $num = "";
my $sum = 0;

	for(my $i=0; $i<3; $i++){
		$dtemp[$p] = $ops[$i];
		$sum=0;

		if($p<14){
			&calc(($p+2),@dtemp);
		}

		
		for(my($y)=0;$y<17;$y++){
			$dtemp[$y] =~ s/ //;	
		
			if($dtemp[$y] =~ /\d/){
				$num = $num . $dtemp[$y];
				
				if($y==16){
					$sum+=$num;
					$num="";
				}
			}
			elsif($dtemp[$y] =~ /\+/){
				$sum+=$num;
				$num = "";
			}
			elsif($dtemp[$y] =~ /\-/){
				$sum+=$num;
				$num = "-";
			}
		}
	
		if($sum==$res){
			push(@resultsarr, join('',@dtemp)."=".$sum."\n");
		}
	}
}
