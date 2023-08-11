#!/usr/bin/perl -w
use strict;
use Data::Dumper;
die "Usage:perl $0 <gff|gff.gz> <Mammalia.gene_info> <tax id> <annovar result> <out>\n" unless @ARGV == 5;
my $gff = $ARGV[0];
open (GFF,($gff =~ /\.gz$/)? "gzip -dc $gff |" : $gff) or die "gzipped gff file required!\n";
open (OUT, ">$ARGV[4]") or die "permission denied!\n";
my %hash; #ID mapping {ID => GeneID}
while(<GFF>){
	next if /^#/;
	chomp;
	#ID=id50;Parent=rna6;Dbxref=GeneID:101121994
	my @tmp = split/\t/;
	next unless $tmp[8] =~ /ID=(\S+?);(.*?)Dbxref=GeneID:(\d+)/;
	print STDERR "$1\t$3\n";
	next unless defined $1;
	$hash{$1} = $3;
}
close GFF;
my %inf; #GeneID => "Symbol\tSynonyms\tdescription"
my $geneinf = $ARGV[1];
open (INF,($geneinf =~ /\.gz$/)? "gzip -dc $geneinf |" : $geneinf) or die "gzipped geneinf file required!\n";
while(<INF>){
	chomp;
	next if /^#/;
	my @tmp = split/\t/;
	next unless $tmp[0] eq $ARGV[2];
	$inf{$tmp[1]} = $tmp[2]."\t".$tmp[4]."\t".$tmp[8];
}
close INF;
open (IN, "$ARGV[3]") or die "annovar result required!\n";
my $match = 0;
my $unmatch = 0;
my $not_parse = 0;
while(<IN>){
	chomp;
	if (/^intergenic/){
		print OUT $_,"\n";
	}
	else{
		print OUT $_,"\t";
		my @tmp = split/\t/;
		my @tran = split/,/,$tmp[1];
		foreach my $id (@tran){
			$id = (split/\(/, $id)[0];
			if (exists $hash{$id}){
				if (exists $inf{$hash{$id}}){
					$match++;
					print OUT $inf{$hash{$id}},"|";
				}
				else{
					$unmatch++;
				}
			}
			else{
				print STDERR $id,"\n";
				$not_parse++;
			}
		}
		print OUT "\n";
	}
}
print STDERR "match:$match\tunmatch:$unmatch\tun parse:$not_parse\n";
close IN;
close OUT;	
