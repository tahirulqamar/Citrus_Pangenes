#!/usr/bin/perl
use strict;
use warnings;
open COORDS,$ARGV[0];
my (@arry,%hash,%temp,%all,$line,$number);
$line = 0;
while (<COORDS>){
        chomp;
        @arry = split /\s+/,$_;
        @arry [2..3] = sort {$a<=>$b} @arry[2..3];
        $hash{$line} = $arry[2];
        $temp{$line} = $arry[3];
        $all{$line} = join "\t",@arry[0 ..14];             
        $line++;     
        }
$number =  $line;
for ( my $i = 1; $i< 10000; $i++ ){
	if (exists $hash{$i+1}){
	      if ((abs($hash{$i} - $temp{$i-1} > 50000))  and  (abs($temp{$i} - $hash{$i+1} > 50000))){
                          next;              
                 }
                    else {
                           print $all{$i} ,"\n";
		}
      }            
}
  print $all{$number-1},"\n";



