use strict;
my ($id,$mh,$fl,$ou,$ou2,$num) = @ARGV;
open ID,$id;
open FL,$fl;
open OU,">$ou";
open OU2,">$ou2";
my ($start,$end);
$start = $end = 0;
my $chr = "";
my (%hash,%len);
my $id_tmp = <ID>;
my @id_tmp = split /\t/,$id_tmp;
$len{$id_tmp[0]} = $id_tmp[2];
my $pre_id = $id_tmp[0];
my $pre_end = $id_tmp[3];
while(<ID>){
	my @arr = split /\t/;
	if ($pre_id eq $arr[0] && $pre_end < $arr[3]){
		$len{$arr[0]} = $arr[3];
		$pre_id = $arr[0];
		$pre_end = $arr[3];
	}
	elsif ($pre_id ne $arr[0]){
		$len{$arr[0]} = $arr[3];
		$pre_id = $arr[0];
		$pre_end = $arr[3];
	}
}
open MH,$mh;
$pre_id = $id_tmp[0];
$pre_end = $id_tmp[3];
my %mh;
while(<MH>){
	my @arr = split /\t/;
	if ($pre_id eq $arr[0] && $pre_end < $arr[3]){
		$mh{$arr[0]} = $arr[3];
		$pre_id = $arr[0];
		$pre_end = $arr[3];
	}
	elsif ($pre_id ne $arr[0]){
		$mh{$arr[0]} = $arr[3];
		$pre_id = $arr[0];
		$pre_end = $arr[3];
	}
}
for my $key(sort keys %len){
	print OU2 "chr\t-\t$key\t$key\t0\t$len{$key}\t$key\n";
}
while(<FL>){
	next if($_ !~ /\tgene\t/);
	my @arr = split /\t/;
	my $label = int(($arr[3] + $arr[4])/2/$num);
	$hash{$arr[0]}{$label}++;
}
my $total;
for my $fir(sort %hash){
	for my $sec(sort {$a<=>$b} keys %{$hash{$fir}}){
		my $start = int($sec * $num *$mh{$fir}/$len{$fir});
		my $end = int(($sec + 1) * $num * $mh{$fir}/$len{$fir});
		if ($end > $mh{$fir}){
			$end = $mh{$fir};
		}
		print OU "$fir\t$start\t$end\t$hash{$fir}{$sec}\n";
		$total += $hash{$fir}{$sec};
	}
}
print $total,"\n";
close FL;
close OU;
close MH;
close ID;
