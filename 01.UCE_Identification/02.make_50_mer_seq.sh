#Mimic all the genomes to k-mers with length of 50bp and 10bp bootstraps
species=$1 #specify species genome

perl kmer_produce.pl {file_pathway}/${species}.fa 50 10 {file_pathway}/${species}_50bp_reads.fa
