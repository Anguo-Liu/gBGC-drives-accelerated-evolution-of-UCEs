#evaluate ultraconservation using 12 vertebrate genomes
species=$1

#step1 make blastdb
makeblastdb -in {file_pathway}/$species.fna \
 -dbtype nucl \
 -parse_seqids -out {file_pathway}/$species.index/

#step2 blastn
blastn -query {file_pathway}/AnceSeq_len200_{mUCEs_or_aUCEs}.fa \
 -db {file_pathway}/$species \
 -out {file_pathway}/{mUCEs_or_aUCEs}.$species.blastn.out \
 -outfmt 6 -num_threads 8 -max_target_seqs 1
