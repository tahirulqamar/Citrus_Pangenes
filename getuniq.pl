#!/usr/bin/perl
use warnings;
use strict;
my ($key,%hash,@arry,%temp,%pos,%dir);
open FL,$ARGV[0];
while(<FL>){
	chomp;
    if ($_ =~ /^>/){
		$key = $_;
		}
	   $hash{$key} .= $_."\t" unless /^>/;
	}
for my$k(keys %hash){
	my@list = split /\t/,$hash{$k};
	#print $k,"\n";
	foreach my$va(@list){
		if ($va =~ /Chr/){
			my @aa = split /\s+/,$va;
			my @bb = split /_/,$aa[1];
			if ($bb[0] =~ s/>//){
			    $temp{$k}{$bb[0]} = $bb[1];
				$pos{$k}{$bb[0]} .= $bb[0]."_".$bb[1]."_".$bb[2]."_";
			    #print "$bb[0]\t$bb[1]\t$bb[2]\n";
			}
	}
	}
} 
open FL1,$ARGV[1];
while (<FL1>){
	chomp;
    my @list = split /\s+/;
	$dir{$_} = $list[0]."_".$list[1]."_".$list[6]."_".$list[7]."_";
	}
=prot
foreach my $k1 (keys %dir){
	foreach my $k2 (keys %{$dir{$k1}}){
		foreach my $k3 (keys %{$dir{$k1}{$k2}}){
	     print "$dir{$k1}{$k2}{$k3}\n";   
	    }
    }
}
=cut
foreach my $k1(keys %pos){
	foreach my $k2 (keys %{$pos{$k1}}){
		my @aa = split /_/,$pos{$k1}{$k2};
		if ($aa[0] =~ /Chr/ and $aa[3] =~ /Chr/ and $aa[5] =~ /ZS97/){
		    #print "$aa[3]\t$aa[4]\t$aa[5]\n";
			print "$aa[0]\t$aa[1]\t$aa[2]\t$aa[3]\t$aa[4]\t$aa[5]\n";
		#if(exists $dir{$pos{$k1}{$k2}}){
		#	print "$dir{$pos{$k1}{$k2}}\n";
			}
		#else {print "err";}
			#}
	}
}
