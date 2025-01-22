use strict;
use Bio::SeqIO;
my ($fl,$mh,$ou,$num) = @ARGV;
my $in = Bio::SeqIO->new(-file=>$fl,-format=>'Fasta');
open OU,">$ou";
open MH,$mh;
my $pre_id = "";
my $pre_end = 0;
my %mh;
while(<MH>){
	my @arr = split /\t/;
	my ($id) = $arr[3];
	$id =~ s/Chr/chr/;
	$mh{$id} = $arr[5];
}
while(my $sub = $in->next_seq()){
	my $id = $sub->id;
	my $seq = $sub->seq;
	my $length = length($seq);
	my ($int) = int(($length - 1)/$num);
	for my $i (0..$int){
		my $start = $i * $num;
		my $end = ($i+1) * $num;

		my $subseq = substr($seq,$start,$num);
		my ($a_num) = $subseq =~ s/[Aa]/A/g;
		my ($t_num) = $subseq =~ s/[Tt]/T/g;
		my ($c_num) = $subseq =~ s/[Cc]/C/g;
		my ($g_num) = $subseq =~ s/[Gg]/G/g;
		my ($gc_level) = ($g_num + $c_num)/($a_num + $g_num + $t_num + $c_num);

		$start = int($start * $mh{$id}/$length);
		$end = int($end * $mh{$id}/$length);
		if ($end > $mh{$id}){
			$end = $mh{$id};
		}
		print OU "$id\t$start\t$end\t$gc_level\n";
	}
}
close FL;
close OU;
