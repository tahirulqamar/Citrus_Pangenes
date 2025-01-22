#!/usr/bin/perl
use warnings;
use strict;
use Data::Dumper;
use Bio::Seq;
use Bio::SeqIO;

die &usage() if @ARGV != 3;
sub usage(){
	my $file_name = __FILE__;
	my $die       = <<DIE;

	Usage: perl $file_name	cds_fa	list	type

DIE
}



my ($fa, $list, $type) = @ARGV;
my $in = Bio::SeqIO -> new(-file=>"$fa", -format=>'fasta');
my %cds;
while (my $seq = $in -> next_seq()){
	#print $seq -> id();
	$cds{ $seq -> id() } = length( $seq -> seq() );
}
#print Dumper(\%cds);


open IN, $list or die $!;
while (<IN>){
	chomp;
#	print "core\t$cds{ $_ }\n" if exists $cds{ $_ };
	print "$type\t$cds{ $_ }\n" if exists $cds{ $_ };
}
close IN;
