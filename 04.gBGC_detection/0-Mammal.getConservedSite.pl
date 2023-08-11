#!/usr/bin/perl
use strict;

open (IN1,"$ARGV[0]") or die "$!:\n";##list
open (IN2,"$ARGV[1]") or die "$!:\n";##maf
open (OUT2,">$ARGV[2]") or die "$!:\n";
open (OUT3,">$ARGV[3]") or die "$!:\n";

my %list;
my @order;
my ($count1,$count2);
my $sum;
my $sample_sum;
while(<IN1>){
	chomp;
	my @tmp=split /\s+/,$_;
	$list{$tmp[0]}=$tmp[1];
	push(@order,$tmp[0]);
	$sample_sum++;
	if($tmp[1]==1){
		$count1++;
	}
	else{
		$count2++;
	}
}

local $/="a ";
<IN2>;
my %output2;
while(<IN2>){
	chomp;
	next if(/^#/);
	my @tmp=split /\n+/,$_;
	my %hash;
	my %output1;
	my $pos;
	my $ref_chr;
	for(my $i=1;$i<=$#tmp;$i++){
		next if($tmp[$i] eq "");
		my @array=split /\s/,$tmp[$i];
		my $sample=(split /\./,$array[1])[0];
		next unless(exists $list{$sample});
		if($i==1){
			$pos=(split /\s+/,$tmp[$i])[2];
			$ref_chr=(split /\./,$array[1],2)[1];
		}
		my @seq=split //,$array[-1];
		for(my $j=0;$j<=$#seq;$j++){
			$hash{$j}{$sample}=uc($seq[$j]);
		}
		for(my $k=0;$k<=$#array-1;$k++){
			$output1{$sample}.="$array[$k] ";
		}
	}
	my (%char1,%char2,%list1_tmp,%list2_tmp,$goat_num);
	foreach my $num(sort {$a<=>$b} keys %hash){
		foreach my $key(keys %{$hash{$num}}){
			if($list{$key}==1){
				$list1_tmp{$num}++;
				if(exists $char1{$num}{$hash{$num}{$key}}){
					$char1{$num}{$hash{$num}{$key}}++;
				}
				else{
                                        $char1{$num}{$hash{$num}{$key}}=1;
                                }
			}
			else{
				$list2_tmp{$num}++;
				if(exists $char2{$num}{$hash{$num}{$key}}){
					$char2{$num}{$hash{$num}{$key}}++;
				}
				else{
                                        $char2{$num}{$hash{$num}{$key}}=1;
                                }
			}
		}
	}
	my $count;
	foreach my $num(sort {$a<=>$b} keys %char1){
		$count++;
		if($hash{$num}{"Mammal_Ance"} eq "-"){
			$count--;
		}
		my ($jj1,$jj2);
		my $core;
		foreach my $neu(keys %{$char1{$num}}){
			$core++;
			$jj1=$neu;
		}
		if($core > 1){
			foreach my $sample(keys %{$hash{$num}}){
				$output1{$sample}.="-";
			}
		}
		else{
			my $judge=0;
			my $ttt;
			foreach my $neu(keys %{$char2{$num}}){
				$ttt++;
				if($neu eq "$jj1"){
					$judge=1;
					last;
				}
			}
			$judge=1 if($ttt==0);
			my ($goat_inf,$cer_inf);
			if($judge==1){
				foreach my $sample(keys %{$hash{$num}}){
					$output1{$sample}.="-";
				}
			}
			else{
				foreach my $sample(keys %{$hash{$num}}){
					$output1{$sample}.="$hash{$num}{$sample}";
					$goat_inf = $hash{$num}{Mammal_ance};
                                        $cer_inf = $hash{$num}{"Afr_Aardvark"};
				}
				my $real_pos=$pos+$num;
				print OUT3 "$ref_chr\t$real_pos\t$goat_inf\t$cer_inf\n";
				my $win=int($real_pos/1000);
				my $win_pos=$win*1000;
				$output2{$ref_chr}{$win_pos}++;
				$sum++;
			}
		}
	}
}
foreach my $chr(sort {$a cmp $b} keys %output2){
	foreach my $POS(sort {$a <=> $b} keys %{$output2{$chr}}){
		print OUT2 "$chr\t$POS\t$output2{$chr}{$POS}\n";
	}
}
print "$sum\n";
