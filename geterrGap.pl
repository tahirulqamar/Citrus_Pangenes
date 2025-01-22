#!/usr/bin/perl
use warnings;
use strict;
open FL,$ARGV[0];
while(<FL>){
	chomp;
	my @arry = split /\t/;
	if ($arry[5] - $arry[1] <0 and $arry[6] - $arry[2] > 0){
		next;
		}
	else {
		print "$arry[0]\t$arry[1]\t$arry[2]\t$arry[3]\t$arry[4]\t$arry[5]\t$arry[6]\n";
		}
	
	}

