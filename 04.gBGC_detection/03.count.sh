#count GC-AT and AT-GC sbustitutions in each UCE
species=$1

cd {file_pathway}/${species}

bedtools coverage -counts -a {file_pathway}/200bp_UCE.bed -b ${species}_GC-AT.bed > ${species}_GC-AT.count

bedtools coverage -counts -a {file_pathway}/200bp_UCE.bed -b ${species}_AT-GC.bed > ${species}_AT-GC.count

cd ..
