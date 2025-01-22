#!/usr/bin/perl
use strict;
use warnings;
open GFF,$ARGV[0];
while (<GFF>){
     chomp;
     if ($_ =~/^\s*$/){
         next;
         }
         else{

            my ($chr,$mrna,$str,$end,$cl,$name) = (split /\t/,$_)[0,2,3,4,6,8];
			  if ($mrna =~/mRNA/){
				if($name =~ /(ID=)(LOC\w+)/){
             print "$chr\t$str\t$end\t$cl\t$2\n";
        }
=prot  
       my @arry = split /\t/;
	   if ($arry[6] =~ /N/) {
		   print "$arry[1]\n";
		   
		   }        
=cut
		 }
}
}
 close GFF;
