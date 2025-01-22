#!/usr/bin/perl
use warnings;
use strict;
open LIST,$ARGV[0];
my %hash;
my $k;
while (<LIST>){
	chomp;
	if ($_ =~ /^>/){
	   $k = $_;
		}
    $hash{$k} .= $_ unless /^>/;
}
my $chr = $ARGV[1];
foreach my $key(keys %hash){
	if ($key =~ /$chr/){
		print "$key\n$hash{$key}\n";
		}
	}
=prot
open FL,$ARGV[1];
while (<FL>){
	chomp;
	my $kk = ">".$_;
	if (exists $hash{$kk}){
		print "$kk\n$hash{$kk}\n";
		}
	}
=cut
