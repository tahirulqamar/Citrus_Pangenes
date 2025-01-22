#!/usr/bin/perl
use warnings;
use strict;
open GFF,$ARGV[0];
my %hash;
while (<GFF>){
	chomp;
    if ($_ =~ /^\s+$/){
		next;
		}
	else{
		my@arry =split /\t/;
		if ($arry[2] =~ /mRNA/ and $arry[8] =~ /GO:/){
		    
			my @go = ($arry[8] =~ /GO:\d+/g);
			my $id = ($arry[8] =~ /(ID=)(ZS\w+)/);
			#for my$a(@go){
				#print "$2\t$a\n";
			#	$hash{$2} = $a;
			#	}
			$hash{$2} = join("\t",@go);
			#print "$id\t".join("\t", @go) .  "\n";
			}
		}	
}
=prot
open PAV,$ARGV[1];
while (<PAV>){
	chomp;
	my $gene=$_;
     $gene =~ s/g/t/g;
	if (exists $hash{$gene}){
		print "$gene\t$hash{$gene}\n";
		}
	}
=cut
