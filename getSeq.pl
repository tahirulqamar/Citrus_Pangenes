#!/usr/bin/perl
use strict;
use warnings;
use Bio::Seq;
use Bio::SeqIO;
my ($fa1,$f1) =@ARGV;
my $zs = Bio::SeqIO->new(-file=>$fa1,-format=>'Fasta');
open LI,$f1;
my %ZS97;
while (my $sub = $zs->next_seq){
	my $chr = $sub->id;
	my $sequence = $sub->seq;
	$ZS97{$chr} = $sequence;
}
while(<LI>){
	chomp;
	my @arr = split /\s+/;
	my $len1 = $arr[2]-$arr[1]+1;
	if ($arr[3] =~ /\+/){
         my $seq_zs = substr($ZS97{$arr[0]},$arr[1]-1,$len1);
        print ">$arr[0]_$arr[4]\n$seq_zs\n";
	}
	elsif($arr[3] =~ /\-/){
		my $seq_zs = substr($ZS97{$arr[0]},$arr[1]-1,$len1);
		my $seq = reverse($seq_zs);
		$seq =~ tr/ATCGatcg/TAGCtagc/;
		print ">$arr[0]_$arr[4]\n$seq\n";
		}
}
