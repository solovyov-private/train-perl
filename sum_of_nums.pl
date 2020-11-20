#!/usr/bin/perl

use strict;
use warnings;

my(@data) = (@ARGV);
my($choice);
my($sum) = 0;

print "Programm for calculating sum of numbers\n";

if(@data != 0){
	#checks 
	for(my $chi = 0; $chi < scalar(@data); $chi++){
		if($data[$chi] !~ /^\-?\d+\.?\d?+$/){
			die "Please, enter only digits!\n";
		}
	}

	print "Please select how it will be calculated and press Enter\n";
	print "(1) for, (2) while, (3) recursion: ";
	
	chomp($choice = <STDIN>);

	if($choice == "1"){
		&CalcFor();
		print $sum."\n";
	}
  elsif($choice == "2"){
		&CalcWhile();
		print $sum."\n";
	}
  elsif($choice == "3"){
		&CalcRecursion(@data);
		print $sum."\n";
	}
  else{
		die "You had to enter only 1, 2 or 3!\n";
	}
} else{
	die "You have not entered any values to calculate\n";
}

sub CalcFor{
	for(my$i=0;$i<scalar(@data);$i++){
		$sum += $data[$i];
	}
}

sub CalcWhile{
	my $i =0;

	while ($i<scalar(@data)) {
		$sum += $data[$i];
		$i++;
	}
}

sub CalcRecursion{
	my $tmp = shift @data;

	if(scalar(@data) > 0){
		$sum+= $tmp;
		CalcRecursion(@data);
	}
  else{
		$sum+=$tmp;
	}
}
