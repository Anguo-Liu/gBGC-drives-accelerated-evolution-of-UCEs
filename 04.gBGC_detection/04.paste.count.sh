#paste two substitution files together 
species=$1

cd {file_pathway}/${species}

paste {file_pathway}/${species}/${species}_AT-GC.count {file_pathway}/${species}/${species}_GC-AT.count |awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$NF}' > {file_pathway}/${species}/${species}.AT-GC.GC-AT.count.merge

cd ..
