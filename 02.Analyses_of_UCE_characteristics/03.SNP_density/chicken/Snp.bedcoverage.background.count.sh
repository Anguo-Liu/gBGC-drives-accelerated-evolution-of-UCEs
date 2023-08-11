bedfile=$1
bedtools coverage \
 -a {file_pathway}/GRCg6a.5555.background.without_chrZ.chr.bed \
 -b {file_pathway}maf_bed/$bedfile \
 -counts > aUCEs.5555.background.snp.`basename $bedfile .bed`.counts
