#get BED file containing GC-AT and AT-GC sbustitution positions
species=$1

cd {file_pathway}/${species}

less {file_pathway}/${species}/${species}_GC-AT |awk -F ":" '{print $1"\t"$2}' |awk  -F "-" '{print $1"\t"$2}' |awk '{print $1"\t"$2+$4-1"\t"$2+$4}' > ${species}_GC-AT.bed

less {file_pathway}/${species}/${species}_AT-GC |awk -F ":" '{print $1"\t"$2}' |awk  -F "-" '{print $1"\t"$2}' |awk '{print $1"\t"$2+$4-1"\t"$2+$4}' > ${species}_AT-GC.bed

cd ..
