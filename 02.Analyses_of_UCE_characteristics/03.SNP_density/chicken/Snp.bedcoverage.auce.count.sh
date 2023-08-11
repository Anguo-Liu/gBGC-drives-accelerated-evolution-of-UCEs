bedfile=$1
bedtools coverage \
 -a {file_pathway}/aUCEs.5555.GRCg6a.without_chrZ.chr.bed \
 -b {file_pathway}/maf_bed/$bedfile \
 -counts > aUCEs.5555.snp.`basename $bedfile .bed`.counts
