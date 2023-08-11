#Get the elements absolutely aligned to the ancestor genome without any mismatch from each species
species=$1

samtools view {file_pathway}/${species}_50bp_reads.sort.bam |awk '$6=="50M"&&$14=="XM:i:0"'|awk '{print $3"\t"$4"\t"$4+49}' > {file_pathway}/${species}.aligned.bed
