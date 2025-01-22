use strict;
use warnings;
my ($fl) = @ARGV;
open FL,$fl or die($!);
my %hash;
while(<FL>){
	chomp;
	my @test = split /\t/;
	my @arr = split /_/,$test[0];
	if ($#arr == 5){
		my $id = join "_",@arr[0..3];
		my $pos = join "\t",$id,@arr[4..5];
		$hash{$arr[0]}{$pos}++;
	}
	elsif ($#arr == 4){
		my $id = join "_",@arr[0..2];
		my $pos = join "\t",$id,@arr[3..4];
		$hash{$id}{$pos}++;
	}
	elsif ($#arr == 3){
		my $id = join "_",@arr[0..1];
		my $pos = join "\t",$id,@arr[2..3];
		$hash{$arr[0]}{$pos}++;
	}
	elsif ($#arr == 2){
		my $id = join "_",$arr[0];
		my $pos = join "\t",$id,@arr[1..2];
		$hash{$arr[0]}{$pos}++;
	}
}
open OU,">clementina.bed";
for my $k1(sort keys %hash){
	for my $k2(sort keys %{$hash{$k1}}){
		print OU "$k2\tclementina\n";
	}
}
close FL;
close OU;
