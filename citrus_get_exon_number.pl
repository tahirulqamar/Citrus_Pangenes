#! perl -w
use strict;
use Data::Dumper;

die &usage() if @ARGV != 3;
sub usage(){
	my $file_name = __FILE__;
	my $die       = <<DIE;

	Usage: perl $file_name	gff3	list	type

DIE
}


my ($gff3, $list, $type) = @ARGV;
my %mrna;
my $id;
open IN, $gff3 or die $!;
while (<IN>) {
	chomp;
#	if (/\tmRNA\t/) {
#		$id = $_ =~ /ID=(.*?);/;
#		$mrna{ $id } = 0;
#	}
	if (/\texon\t/) {
		$_ = $_ . ";";
		my ($parent) = $_ =~ /Parent=(.*?);/;
		$mrna{ $parent }++;
	}
}
close IN;
#print Dumper(\%mrna);


open IN, $list or die $!;
while (<IN>) {
	chomp;
#	print "core\t$mrna{ $_ }\n" if exists $mrna{ $_ };
	print "$type\t$mrna{ $_ }\n" if exists $mrna{ $_ };
}
close IN;
