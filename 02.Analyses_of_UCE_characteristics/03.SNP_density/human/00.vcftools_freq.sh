#!/bin/bash

#step1 get biallelic SNVs and calculate frequency
for i in $(seq 1 22) X
do
	vcftools --gzvcf {file_pathway}/1kGP_high_coverage_Illumina.chr$i.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
 --remove-indels \
 --max-alleles 2 \
 --min-alleles 2 \
 --freq \
 --out {file_pathway}/1kGP_high_coverage_Illumina.chr$i.filtered.SNV.phased_panel
done

#step2 integrate all files together
echo -e "CHROM\tPOS\tID\tref\talt\tN_ALLELES\tN_CHR\tref_freq\talt_freq" > 1kGP_high_coverage_Illumina.autosome.addX.SNV.phased_panel.freq.txt

for i in $(seq 1 22)
do
	 awk -v FS='[\t:]' -v OFS='\t' '{if(NR!=1) print $1,$2,$1":"$2,$5,$7,$3,$4,$6,$8}' 1kGP_high_coverage_Illumina.chr$i.filtered.SNV.phased_panel.frq >> 1kGP_high_coverage_Illumina.autosome.addX.SNV.phased_panel.freq.txt
done

sed 's/chr//g' -i 1kGP_high_coverage_Illumina.autosome.addX.SNV.phased_panel.freq.txt
