#!/usr/bin/perl
use warnings;
use strict;
open FL,$ARGV[0];
while(<FL>){
	chomp;
	my @arry = split /\s+/;
	if ($arry[5] eq $arry[11]){
		next;
		}
	else {
		print $_,"\n";
		}
	
	}
