bedfile=$1
bedtools coverage \
 -a {file_pathway}/mUCE.2186.chr.bed \
 -b {file_pathway}/$bedfile \
 -mean > mUCES.2186.snp.`basename $bedfile .bed`.corverage
