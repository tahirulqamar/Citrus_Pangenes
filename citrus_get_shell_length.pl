#! perl -w
use strict;
use Data::Dumper;

die &usage() if @ARGV != 3;
sub usage(){
	my $file_name = __FILE__;
	my $die       = <<DIE;

	Usage: perl $file_name	gff3	cds_list	[core|shell]

DIE
}


my ($gff3, $list, $type) = @ARGV;

my %gene;
my %mrna;
open IN,$gff3 or die $!;
while (<IN>){
	chomp;
	$_ = $_.";";
	if(/\tgene\t/) {
		my @line = split;
		my ($id) = $_ =~ /ID=(.*?);/;
		$gene{ $id } = abs($line[5-1] - $line[4-1]) + 1;
	}
	elsif (/\tmRNA\t/) {
		my @line = split;
		my ($id)		= $_ =~ /ID=(.*?);/;
		my ($parent)	= $_ =~ /Parent=(.*?);/;
		$mrna{ $id }	= $parent;
	}
}
close IN;
#print Dumper(\%gene);

open IN,$list or die $!;
while (<IN>) {
	chomp;
#	print "$_\t$gene{ $mrna{$_} }\n";
	if ( exists $mrna{ $_ }){
		print "$type\t$gene{ $mrna{$_} }\n" if exists $gene{ $mrna{$_} };
	}
}
close IN;
