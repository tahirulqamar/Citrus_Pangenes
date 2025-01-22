#!/usr/bin/perl
use warnings;
use strict;
open FL,$ARGV[0];
while(<FL>){
	chomp;
	my @aa = split /\s+/;
	@aa[2..3] = sort {$a<=>$b} @aa[2..3];
	print "$aa[0]\t$aa[1]\t$aa[2]\t$aa[3]\t$aa[4]\t$aa[5]\t$aa[6]\t$aa[7]\t$aa[8]\t$aa[9]\t$aa[10]\t$aa[11]\t$aa[12]\t$aa[13]\t$aa[14]\n";
	#print "$aa[0]\t$aa[1]\t$aa[2]\t$aa[3]\t$aa[4]\n"
	}
