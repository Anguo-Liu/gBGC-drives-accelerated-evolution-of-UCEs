#calculate q value
species=$1

R CMD BATCH {file_pathway}/$species/Rscript/qvalue.R
