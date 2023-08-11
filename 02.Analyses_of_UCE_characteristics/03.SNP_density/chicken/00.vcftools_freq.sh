#!/bin/bash

#step1 get biallelic SNVs and calculate frequency
vcftools --gzvcf {file_pathway}/GRCg6a.sample928.SNP.vcf.gz \
 --remove-indels \
 --max-alleles 2 \
 --min-alleles 2 \
 --freq \
 --out {file_pathway}/GRCg6a.sample928.SNP.vcf.freq

#step2
echo -e "CHROM\tPOS\tID\tref\talt\tN_ALLELES\tN_CHR\tref_freq\talt_freq" > GRCg6a.sample928.SNP.vcf.freq.txt

sed 's/chr//g' -i GRCg6a.sample928.SNP.vcf.freq.txt
