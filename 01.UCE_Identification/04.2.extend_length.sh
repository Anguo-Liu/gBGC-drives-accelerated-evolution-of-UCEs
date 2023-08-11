#Merge all of the 100% aligned elements together

#step1
cat {file_pathway}/*aligned.bed > {file_pathway}/all.bed

#step2
bedtools sort \
 -faidx {file_pathway}/ancestor.chrinfo \
 -i {file_pathway}/all.bed > {file_pathway}/all.sort.bed
  #ancestor.chrinfo is a chromosome list of the ancestor genome

#step3
bedtools merge -i {file_pathway}/all.sort.bed|uniq > {file_pathway}/all.sort.merge.bed
