#!/usr/bin/perl
use strict;
use warnings;
open AL,$ARGV[0];
my $rstr_1 = 0;
my $rend_1 = 0;
my $qstr_1 = 0;
my $qend_1 = 0;
while(<AL>){
    chomp;
    my ($chr_2,$rstr_2 , $rend_2 , $qstr_2 , $qend_2 ) = (split /\t/ , $_)[0,1,2,3,4];
     ($qstr_2 , $qend_2) = sort {$a<=>$b} ($qstr_2 , $qend_2);
     ($rstr_2 , $rend_2) = sort {$a<=>$b} ($rstr_2 , $rend_2);
     my $len = $rstr_2 - $rend_1;
	 print "$len\n";
     $qstr_1 = $qstr_2;
     $qend_1 = $qend_2;
     $rstr_1 = $rstr_2;
     $rend_1 = $rend_2;
	 #$aliLen_1 = $aliLen_2;
=prot
        if ($qend_2 - $qstr_1 > 100){
			print "$rid\t$rend_1\t$qend_1\t$qstr_2\t$cl\n"
			}
     $qstr_1 = $qstr_2;
     $qend_1 = $qend_2;
     $rstr_1 = $rstr_2;
     $rend_1 = $rend_2;


=cut
 } 
close AL;              
     
