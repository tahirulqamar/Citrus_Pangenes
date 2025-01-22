#! perl -w
use strict;
use Data::Dumper;

die &usage() if @ARGV != 2;
sub usage(){
	my $file_name = __FILE__;
	my $die       = <<DIE;

		Usage: perl $file_name	Orthogroups.tsv.binary	Top10.list > Top10.Orthogroups.binary

DIE
}





my ($all, $sub) = @ARGV;
my %sub;
open IN, $sub or die $!;
while (<IN>) {
	chomp;
	my @line = split;
#	print Dumper(\@line),"\n";
	my $key = join("\t",@line[2-1..$#line]);
	$sub{ $key } = 1;
}
close IN;
#print Dumper(\%sub);


open IN, $all or die $!;
while (<IN>) {
	if (/^ID/){
		print;
	}
	else {
		chomp;
		my @line = split;
		my $key  = join("\t",@line[2-1..$#line]);
		print "$line[1-1]\t$key\n" if exists $sub{ $key };
	}
}
close IN;
