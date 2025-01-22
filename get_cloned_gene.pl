#!/usr/bin/perl
use warnings;
use strict;
open PSL,$ARGV[0];
my $chr = $ARGV[1];
while (<PSL>){
	chomp;
	my @arry =split /\t/;
	if ($arry[1] =~ /$chr/ and $arry[5] =~ /$chr/){
		print $_,"\n";
		}
	}
