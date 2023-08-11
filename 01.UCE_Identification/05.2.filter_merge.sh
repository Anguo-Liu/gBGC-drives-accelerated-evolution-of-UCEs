#Filter the elements with identity and coverage and merge the results to get the identity matrix of candidate UCEs in all species
species=$1 #specify species

#step1
python {file_pathway}/filter_blastn_out.py \
 -i {file_pathway}/${species}.blastn.out \
 -o {file_pathway}/${species}.blastn.filter.out

#step2
for i in {file_pathway}/*.blastn.filter.out;do echo $PWD/$i >> {file_pathway}/merge_filter.list;done
  #generate the full pathway of all filtered blastn results

#step3
python {file_pathway}/merge.filter.bed.list.iden.py \
 -l {file_pathway}/merge_filter.list \
 -o {file_pathway}/merge_candidate_UCEs_iden.out
