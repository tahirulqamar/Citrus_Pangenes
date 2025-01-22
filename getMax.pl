#!/usr/bin/perl
use strict;
use warnings;
my $f = $ARGV[0];
open MH, $f;
my (@arry,%hash,%ha);
while (<MH>){
      @arry = split /\t/,$_;
      $hash{$arry[9]} .= $arry[0]."_" ;
        $ha{$arry[9]."_".$arry[0]}= $_;
}
for my $l (keys %hash){
	my @a = split "_",$hash{$l};
	my @s = sort {$b <=> $a} @a;
	print $ha{$l."_".$s[0]};
}
close MH;
