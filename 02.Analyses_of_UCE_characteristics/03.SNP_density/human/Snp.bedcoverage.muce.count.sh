bedfile=$1
bedtools coverage \
 -a {file_pathway}/mUCE.2186.chr.bed \
 -b {file_pathway}/$bedfile \
 -counts > mUCES.2186.snp.`basename $bedfile .bed`.counts
