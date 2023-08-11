#Filter the elements that are not longer than 100bp
#step1
less -S {file_pathway}/all.sort.merge.bed| awk '$2-$1+1>100' > {file_pathway}/candidate_UCEs.bed

#step2
bedtools getfasta \
 -fi {file_pathway}/ancestor.fa \
 -bed {file_pathway}/candidate_UCEs.bed \
 -fo {file_pathway}/candidate_UCEs.fa
