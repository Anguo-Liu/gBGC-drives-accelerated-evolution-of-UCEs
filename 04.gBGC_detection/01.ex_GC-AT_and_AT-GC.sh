#extract GC-AT and AT-GC sbustitutions in each UCE
species=$1

cd {file_pathway}/${species}

less $species.pos |awk '$3=="G"||$3=="C"'|awk '$4=="A"||$4=="T"' >${species}_GC-AT

less $species.pos |awk '$3=="A"||$3=="T"'|awk '$4=="G"||$4=="C"' >${species}_AT-GC

cd ..
