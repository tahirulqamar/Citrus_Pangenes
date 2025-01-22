#!/usr/bin/perl
use warnings;
use strict;
open FA,$ARGV[0];
while(<FA>){
	chomp;
	my $k;
	if ($_ =~ /^>/){
		$k = $_;
		my @aa = split /_/,$k;
		print "$aa[0]\t$aa[3]\t$aa[4]\t$aa[1]\t$aa[2]\t$aa[5]\n";
		}
	}
