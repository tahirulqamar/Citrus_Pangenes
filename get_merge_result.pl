my ($fl,$ou) = @ARGV;
my @pre = ("Chr01","733616","739928");
my @last = ("Chr12","100000000","100000000");
open FL,$fl;
open OU,">$ou";
while(<FL>){
	chomp;
	my @arr = split /\t/;
	if ($arr[0] eq $pre[0] && ($arr[1] - $pre[2]) * ($arr[2] - $pre[1]) <= 0){
		my @pos = sort {$a<=>$b} @pre[1..2],@arr[1..2];
		$pre[1] = $pos[0];
		$pre[2] = $pos[3];
	}
	elsif($arr[0] ne $pre[0] or ($arr[0] eq $pre[0] && ($arr[1] - $pre[2]) * ($arr[2] - $pre[1]) > 0)){
		print OU "$pre[0]\t$pre[1]\t$pre[2]\n";
		$pre[0] = $arr[0];
		$pre[1] = $arr[1];
		$pre[2] = $arr[2];
	}
}
close FL;
close OU;
