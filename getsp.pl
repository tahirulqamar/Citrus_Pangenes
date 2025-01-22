#!/usr/bin/perl
use warnings;
use strict;

open FL,$ARGV[0];
while(<FL>){
	chomp;
	my @arry = split /\t/;
	my $len1 = $arry[2] -$arry[1]  ;
	my $len2 = $arry[3] - $arry[1];
	my $len3 = $arry[3] - $arry[2];
	if ($len1 >50000){
        print "$_\n";
}
}
=cut
    else {
		print "$_\n";
		}
}
