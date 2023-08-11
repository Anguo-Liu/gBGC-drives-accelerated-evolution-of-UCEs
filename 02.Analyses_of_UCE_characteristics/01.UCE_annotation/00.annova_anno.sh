##annova annotation (here, use human reference as example for mUCE annotation)
#step1
gtfToGenePred -genePredExt {file_pathway}/hg38.chr.gtf human_refGene.txt

#step2
perl {file_pathway}/retrieve_seq_from_fasta.pl \
 --format refGene \
 --seqfile {file_pathway}/hg38_chr.fa human_refGene.txt \
 -out human_refGeneMna.fa

#step3
perl {file_pathway}/annotate_variation.pl \
 --outfile mammalian_UCEs_background \
 --buildver Human {file_pathway}/mammalian_UCEs_background.anno.bed Human

#step4
perl {file_pathway}/NCBI.gff.table.pl {file_pathway}/hg38.chr.gff {file_pathway}/All_Mammalia.gene_info.gz 9925 human_UCEs.variant_function human_UCEs.anno.finalout
