#!/usr/bin/perl
use strict;
use warnings;
open AL,$ARGV[0];
my $rstr_1 = 0;
my $rend_1 = 0;
my $qstr_1 = 0;
my $qend_1 = 0;
my $aliLen_1 = 0;
#print "MH_id\tpav_to_mh_start\tpav_to_mh_end\tpav_start\tpav_end\trefer_len\tquery_len\tstrand\n";
while(<AL>){
    chomp;
    my ($rstr_2 , $rend_2 , $qstr_2 , $qend_2 , $aliLen_2 , $idt , $cl , $rid , $qid) = (split /\t/ , $_)[0,1,2,3,5,6,12,13,14];
     ($qstr_2 , $qend_2) = sort {$a<=>$b} ($qstr_2 , $qend_2);
     ($rstr_2 , $rend_2) = sort {$a<=>$b} ($rstr_2 , $rend_2);
      if ($qend_2 > $qstr_1){
              if ($qstr_2 - $qend_1 > 100){
				  my $len1 = $rstr_2 - $rend_1;
				  my $len2 = $qstr_2 - $qend_1;
                  print "$rid\t$qend_1\t$qstr_2\t$rend_1\t$rstr_2\t$len2\t$len1\t$cl\n";
                   }
         }
      elsif($qend_2 < $qstr_1){
                 if($qstr_1 - $qend_2 > 100){
					 my $len1 = $rstr_2 - $rend_1;
					 my $len2 = $qstr_2 - $qend_1;
                     print "$rid\t$qend_2\t$qstr_1\t$rend_1\t$rstr_2\t$len2\t$len1\t$cl\n"
                     
                  }                
         }
     $qstr_1 = $qstr_2;
     $qend_1 = $qend_2;
     $rstr_1 = $rstr_2;
     $rend_1 = $rend_2;
	 $aliLen_1 = $aliLen_2;
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
     
