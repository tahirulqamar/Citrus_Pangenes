#!/usr/bin/perl
use warnings;
use strict;
my (%id,%gene,%hash);
open FL,$ARGV[0];
while(<FL>){
	chomp;
	my @line = split /\t/;
    $gene{$line[10]} = $line[7]."\t".$line[8]."\t".$line[9]; 
	#push (@{$id{$line[0]}{$line[10]}},"$line[1]\t$line[2]")
	$id{$line[0]}{$line[10]} .=$line[1]."_".$line[2]."_";
	$hash{$line[0]}{$line[10]} .= $line[3]."_".$line[4]."_";
	}
foreach my $k1(keys%id){
	foreach my $k2 (keys %{$id{$k1}}){
		my @aa = split /_/,$id{$k1}{$k2};
		@aa = sort @aa;
        print "$k1\t$aa[0]\t$aa[$#aa]\t$hash{$k1}{$k2}\t$k1\t$gene{$k2}\t$k2\n";
		}
	}
