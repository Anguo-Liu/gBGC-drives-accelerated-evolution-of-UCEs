#Mapping the candidate UCEs to each species genome
species=$1 #specify species genome

#step1
makeblastdb -in {file_pathway}/${species}.fa \
 -dbtype nucl \
 -out {file_pathway}/${species}_db

#step2
blastn -query {file_pathway}/candidate_UCEs.fa \
 -db {file_pathway}/${species}_db \
 -out {file_pathway}/${species}.blastn.out \
 -outfmt 6 -evalue 1e-5 -num_threads 4 -max_target_seqs 1 -max_hsp 1
