#!/usr/bin/perl
use warnings;
use strict;
my(%hash1,%hash2) ;
open BLA,$ARGV[0];
while (<BLA>){
	chomp;
	my @line = split /\s+/,$_;
	push (@{$hash1{$line[1]}}, "$line[8]\t$line[9]");
	}
my $start = 0;
my $end = 0;
foreach my $key (sort keys %hash1){
	print $key."\t";
	my $count;
	my @tt=@{$hash1{$key}};
	for my $i(0..$#tt){
    	 ($start,$end)=split /\s+/,$tt[$i];
		($start,$end) = sort{$a<=>$b}($start,$end);
		#print $start."\t".$end."\n";
		foreach my $j($start..$end){
			unless( exists $hash2{$key}{$j}){
				$hash2{$key}{$j}=1;
				#print $j."\n";
            }
	    }
   }
    foreach my $k1(keys %{$hash2{$key}}){
	#foreach my $k1(0..$#{$hash2{$key}}){
	     if($hash2{$key}{$k1} == 1){
	       # print "$hash2{$key}{$k1}\n";
			$count++;
		}
	}
print "$count\n";
}
