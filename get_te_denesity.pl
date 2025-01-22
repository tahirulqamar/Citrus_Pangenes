use strict;
my ($id,$mh,$fl,$ou,$num) = @ARGV;
open ID,$id;
open FL,$fl;
open OU,">$ou";
my ($start,$end);
$start = $end = 0;
my $chr = "";
my (%hash,%len,%mh);
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
while(<FL>){
	next if(/Simple_repeat/ or /Low_complexity/);
	my @arr = split /\t/;
	my $label1 = int(($arr[5] - 1)/$num);
	my $label2 = int(($arr[6] - 1)/$num);
	if ($label1 eq $label2){
		if (($start == 0 && $end == 0) or ($chr ne $arr[4])){
			$hash{$arr[4]}{$label1} = $arr[6] - $arr[5] + 1;
			$start = $arr[5];
			$end = $arr[6];
			$chr = $arr[4];
		}
		elsif ($chr eq $arr[4] && $end >= $arr[6]){
			$start = $arr[5];
		}
		elsif ($chr eq $arr[4] && $end < $arr[6] && $end >= $arr[5]){
			$hash{$arr[4]}{$label1} += $arr[6] - $end;
			$start = $arr[5];
			$end = $arr[6];
		}
		elsif ($chr eq $arr[4] && $end < $arr[5]){
			$hash{$arr[4]}{$label1} += $arr[6] - $arr[5] + 1;
			$start = $arr[5];
			$end = $arr[6];
		}
	}
	elsif ($label1 ne $label2){
		my $pre = int (($end - 1)/$num);
		if (($start == 0 && $end == 0) or ($chr ne $arr[4])){
			$hash{$arr[4]}{$label1} = $label2 * $num - $arr[5] + 1;
			$hash{$arr[4]}{$label2} = $arr[6] - $label2 * $num;
			$start = $arr[5];
			$end = $arr[6];
			$chr = $arr[4];
		}
		elsif ($chr eq $arr[4] && $end >= $arr[6]){
			$start = $arr[5];
		}
		elsif ($end < $arr[6] && $end >= $arr[5] && $pre == $label2){
			$hash{$arr[4]}{$label2} += $arr[6] - $end;
			$end = $arr[6];
			$start = $arr[5];
		}
		elsif ($end < $arr[6] && $end >= $arr[5] && $pre < $label2){
			$hash{$arr[4]}{$label1} += $label2 * $num - $end;
			$hash{$arr[4]}{$label2} += $arr[6] - $label2 * $num;
			$end = $arr[6];
			$start = $arr[5];
		}
		elsif ($end < $arr[5]){
			$hash{$arr[4]}{$label1} += $label2 * $num - $arr[5] + 1;
			$hash{$arr[4]}{$label2} += $arr[6] - $label2 * $num;
			$end = $arr[6];
			$start = $arr[5];
		}
		else{
			print $_;
		}
	}
	else{
		print $_;
	}
}
my $total;
for my $fir(sort %hash){
	for my $sec(sort {$a<=>$b} keys %{$hash{$fir}}){
		my $mh_len = $mh{$fir};
		my $zs_len = $len{$fir};
		my $start = int($sec * $num * $mh_len/$zs_len);
		my $end = int(($sec + 1) * $num * $mh_len/$zs_len);
		if ($end > $mh_len){
			$end = $mh_len;
		}
		print OU "$fir\t$start\t$end\t$hash{$fir}{$sec}\n";
		$total += $hash{$fir}{$sec};
	}
}
print $total,"\n";
close FL;
close OU;
