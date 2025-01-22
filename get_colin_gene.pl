#!/usr/bin/perl
use warnings;
use strict;
open TXT,$ARGV[0];
my %hash1;
my %hash2;
my %hash3;
my %hash;
while(<TXT>){
	chomp;
	my @arry =split /\t/;
	$hash1{$arry[5]} = $_;
	$hash2{$arry[6]} = $_;
	$hash3{$arry[7]} = $_;
	#$hash{$arry[1]} ="A123"."_". $arry[5];
	#print "IR8"."_".$arry[5],"\n";
	}
open GENE,$ARGV[1];
while (<GENE>){
	chomp;
	my @arry =split /\t/;
=prot
	# print $arry[3],"\n";
    if (exists$hash{$arry[3]}){
		print "$hash{$arry[3]}\t$arry[0]\t$arry[1]\t$arry[2]\t$arry[3]\t$arry[4]\n";
		}
	else {
		print"NA\t$arry[0]\t$arry[1]\t$arry[2]\t$arry[3]\t$arry[4]\n"; 
		}

=cut
	$arry[1] =~ s/^Chr\d+\_//;
	if (exists$hash1{$arry[1]}){
		print "$arry[0]\t$arry[1]\t$arry[5]\t$hash1{$arry[1]}\n";
		}
    elsif(exists $hash2{$arry[1]}){
		print "$arry[0]\t$arry[1]\t$arry[5]\t$hash2{$arry[1]}\n";
		}
	elsif(exists $hash3{$arry[1]}){
		print "$arry[0]\t$arry[1]\t$arry[5]\t$hash3{$arry[1]}\n";
		}
	#else{print "$arry[0]\t$arry[1]\t$arry[2]\t$arry[3]\t$arry[4]\n";}

}
