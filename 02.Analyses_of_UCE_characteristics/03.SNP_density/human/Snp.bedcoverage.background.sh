bedfile=$1
bedtools coverage \
 -a {file_pathway}/mUCE.2186.background.chr.bed \
 -b {file_pathway}/$bedfile \
 -mean > mUCES.2186.background.snp.`basename $bedfile .bed`.corverage
