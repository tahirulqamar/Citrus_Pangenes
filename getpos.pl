#!/usr/bin/perl
use strict;
use warnings;
open ZS,$ARGV[0];
my %hash;
while(<ZS>){
	chomp;
	my @arry = split /\s+/;
	$hash{$arry[0]}{$arry[1]} = $_;
}
open FI,$ARGV[1];
while (<FI>){
	chomp;
	my @arry = split /\t/;
	if (exists $hash{$arry[0]}{$arry[1]}){
		print $hash{$arry[0]}{$arry[1]},"\n";
	}
}
