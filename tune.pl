#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

open IN,$ARGV[0];

my $init = 0;
my $count = 0;
my @tmp;
while(<IN>){
	chomp;
	my @line = split/\s+/;
	if($line[1] > $init){
		print "$tmp[2]\t$tmp[3]\n" if $init;
		print "$line[0]\t$line[1]\t";
		@tmp = @line;
		$init = $line[2];
	}else{
		@tmp = @line;
		$init = $tmp[2];
	}
}
close IN;
