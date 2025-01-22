#! perl -w
use strict;

my ($in,$out) = @ARGV;

open IN, $in or die $!;
open OUT, ">$out" or die $!;
while (<IN>){
	chomp;
	my @line    = split/_/;
	my $end     = pop(@line);
	my $start   = pop(@line);
	my $chr   = join("_",@line);
	print OUT "$chr\t$start\t$end\n"
}
close IN;
close OUT;
