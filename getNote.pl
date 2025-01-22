#!/usr/bin/perl
use strict;
use warnings;
my(%hash);
open GENE,$ARGV[0];
while (<GENE>){
	chomp;
	my @arry = split /\t/;
	$hash{$arry[4]} = $_;
}
close GENE;
open NOTE,$ARGV[1];
while(<NOTE>){
	chomp;
	my $list = $_;
    	if ( exists $hash{$list}){
	          print $hash{$list},"\n";
		}
    }
