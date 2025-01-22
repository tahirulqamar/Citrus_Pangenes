use strict;
use warnings;
my ($agp,$fl,$ou,$other) = @ARGV;
open AG,$agp;
open FL,$fl;
open OU,">$ou";
open OT,">$other";
my %hash;
while(<AG>){
	next if (/GAP/);
	chomp;
	my @arr = split /\t/;
	$hash{$arr[3]} = $_;
}
while(<FL>){
	chomp;
	my @arr = split /\t/;
	if (!exists($hash{$arr[0]})){
		print OT "$_\n";
		next;
	}
	my @tmppos = split /\t/,$hash{$arr[0]};
	if ($tmppos[5] eq '-'){
		my $start = $tmppos[6] + $tmppos[7] - $arr[3] + $tmppos[1] + 1; ##bed is 0-based position
		my $end = $tmppos[6] + $tmppos[7] - $arr[4] + $tmppos[1] + 1;
		$arr[3] = $end;
		$arr[4] = $start;
		if ($arr[6] eq "-"){
			$arr[6] = "+";
		}
		elsif ($arr[6] eq "+"){
			$arr[6] = "-";
		}
	}
	elsif ($tmppos[6] eq '+'){
		my $start = $arr[3] - $tmppos[6] + $tmppos[1] ;
		my $end = $arr[4] - $tmppos[6] + $tmppos[1];
		$arr[4] = $end;
		$arr[3] = $start;
	}
	my $tmp = join "\t",$tmppos[0],@arr[1..$#arr];
	print OU "$tmp\n";
}
close FL;
close OU;
close AG;
