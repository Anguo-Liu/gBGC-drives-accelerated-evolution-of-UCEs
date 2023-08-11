#extract UCEs with GC substitutions more than AT substitutions
species=$1

cd {file_pathway}/${species}
less {file_pathway}/${species}/${species}.AT-GC.GC-AT.count.merge |awk '$5>$6' > {file_pathway}/${species}/${species}.count.merge.GC.more
