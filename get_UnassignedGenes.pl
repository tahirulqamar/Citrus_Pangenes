#! perl -w
use strict;
use Data::Dumper;

die &usage() if @ARGV != 1;
sub usage(){
        my $file_name = __FILE__;
        my $die       = <<DIE;

        Usage: perl $file_name	Orthogroups_UnassignedGenes.tsv

DIE
}

open IN, $ARGV[1-1] or die $!;
my @title = ();
my %sp;
while (<IN>) {
	chomp;
	if (/^\t/) {
		@title  = split;
#		print Dumper(\@line);
	}
	else {
		my @line = split/\t/,$_,-1;
		for my $index (1..$#line){
			if ($line[$index] ne '') {
				push @{$sp{ $title[$index-1] }}, $line[1-1];
#				print "$title[$index - 1]\t$line[1-1]\n";
			}
		}
	}
}
close IN;
#print Dumper(\%sp);


for my $sp (sort keys %sp){
	my @family = @{ $sp{ $sp }};
	print "$sp\t",join(",",@family),"\n";
}
