#!/usr/bin/perl
use strict;
use warnings;
open FA,$ARGV[0];
my (%hash,$key);
while(<FA>){
     chomp;
     if (/^>/){
         $key = $_;
}
         $hash{$key} .= $_ unless /^>/;
} 
my $chr = $ARGV[1];
foreach my $l(keys %hash){
            if ($l =~ m/$chr/){
               print "$l\n$hash{$l}\n";
}
}
