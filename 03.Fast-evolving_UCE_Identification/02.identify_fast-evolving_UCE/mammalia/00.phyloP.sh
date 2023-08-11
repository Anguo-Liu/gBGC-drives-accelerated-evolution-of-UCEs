# generate fast-evolving UCEs by phyloP

chr=$1
species=$2 # specifying species or clade
phyloP --msa-format MAF \
 --features {file_pathway}/mUCEs_info/$chr.bed \
 --subtree $species \
 --method LRT \
 --mode CONACC {file_pathway}/95_mammals.nonconserved-4d.mod {file_pathway}/$chr.project.maf > {file_pathway}/$species/$species.$chr.ACC.sc
