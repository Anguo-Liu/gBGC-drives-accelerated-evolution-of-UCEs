#Aligning all reads from different genomes to the ancestor genome, separately
species=$1 #specify species genome

#step1
bowtie2 -p 4 \
 -x {file_pathway}/ancestor.fa \
 -f {file_pathway}/${species}_50bp_reads.fa \
 --no-unal \
 -S {file_pathway}/${species}_50bp_reads.sam

#step2
samtools view -bS {file_pathway}/${species}_50bp_reads.sam > {file_pathway}/${species}_50bp_reads.bam

#step3
samtools sort {file_pathway}/${species}_50bp_reads.bam > {file_pathway}/${species}_50bp_reads.sort.bam
