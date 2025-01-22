#!/usr/bin/perl
use warnings;
use strict;
open FL,$ARGV[0];
while (<FL>){
	chomp;
	my @arry = split /\t/;
	if ($arry[3]/$arry[12]>0.80){
		print "$arry[0]\n";
		}
	}
