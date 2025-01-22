#!/usr/bin/perl
use strict;
use warnings;
open PAV,$ARGV[0];
my (%hash1,%hash2);
while (<PAV>){
	chomp;
	my ($chr,$pstr,$pend,$gstr,$gend,$gname) = (split /\s+/)[0,1,2,4,5,6];
    #my $pav = join ("_",$pstr,$pend);
	my $gene = join("_",$gstr,$gend);
	#my $mhpos = join("_",$mhstr,$mhend);
	$hash1{$chr}{$pstr}{$pend} .= $gene."_";
	$hash2{$chr}{$pstr}{$pend} .= $gname."&";
    #$hash1{$chr}{$pstr}{$pend} .= $gene."_";
    #$hash2{$chr}{$pstr}{$pend} .= $gname."&";
}

for my$k1 (sort keys %hash1){
	for my$k2(sort {$a<=>$b} keys %{$hash1{$k1}}){
	     for my$k3(sort {$a<=>$b} keys %{$hash1{$k1}{$k2}}){
			 #for my$k4( sort {$a<=>$b} keys%{$hash1{$k1}{$k2}{$k3}}){
			#	 for my$k5(sort {$a<=>$b} keys%{$hash1{$k1}{$k2}{$k3}{$k4}}){
		             my @arry = split "_",$hash1{$k1}{$k2}{$k3};
			         my@ss = sort{$a<=>$b}@arry;
			         my$left = &min($k2,$ss[0]);
			         my$right = &max($k3,$ss[$#ss]);
			         print "$k1\t$left\t$right\t$hash2{$k1}{$k2}{$k3}\n";
		       # }
			# }
		 }
	}
}
sub min {
	my ($m,$n);
	($m,$n) = @_;
	if ($m > $n){$n} else{$m}
	}
sub max {
	my ($m,$n);
	($m,$n) = @_;
	if ($m > $n){$m} else{$n}
	}
close PAV;

