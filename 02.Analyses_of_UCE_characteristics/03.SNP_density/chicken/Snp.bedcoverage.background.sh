bedfile=$1
bedtools coverage \
 -a {file_pathway}/GRCg6a.5555.background.without_chrZ.chr.bed \
 -b $bedfile \
 -mean > aUCEs.5555.background.snp.`basename $bedfile .bed`.corverage
