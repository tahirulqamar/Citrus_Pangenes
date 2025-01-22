#! perl -w
use strict;
use Data::Dumper;


die &usage() if @ARGV != 1;
sub usage(){
        my $file_name = __FILE__;
        my $die       = <<DIE;

        Usage: perl $file_name	[Orthogroups.tsv|Orthogroups_UnassignedGenes.tsv]

DIE
}

my ($file1) = @ARGV;
open IN, $file1 or die $!;
open OUT, ">$file1.binary" or die $!;
while (<IN>){
	chomp;
	my $n = 0;
	if( /^\t/) {
		print OUT "ID$_";
	}
	else{
		my @line = split/\t/,$_,-1;
		print OUT "$line[1-1]\t";
		for my $index (1..$#line){
			if ($line[$index] ne ''){
				print OUT "1\t";
#				$n++;
			}
			else {
				print OUT "0\t";
			}
		}
	}
	print OUT "\n";
}
close IN;
close OUT;
