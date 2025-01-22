#!/usr/bin/perl
use warnings;
use strict;
open FA,$ARGV[0];
my %hash;
my $k;
while (<FA>){
	chomp;
	if ($_ =~ /^>/){
		$k = $_;
		}
    $hash{$k} = $_ unless /^>/;
	}
open GENE,$ARGV[1];
while(<GENE>){
	chomp;
	my @arry = split /\t/;
     my$gene = ">".$arry[1];
	if (exists $hash{$gene}){
		print "$gene\n$hash{$gene}\n";
		}
	}
