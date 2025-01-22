#!/usr/bin/perl
use strict;
use warnings;
open FL,$ARGV[0];
my ($len,$total);
while(<FL>){
    chomp;
	my @arry = split /\s+/;
	 $len = $arry[2] - $arry[1] -1 ;
     #$total +=$arry[1];
     $total +=$len;
   #print "$len\n";
}
print $total,"\n";
#print "$len \n";

