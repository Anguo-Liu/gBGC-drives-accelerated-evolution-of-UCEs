## Steps to obtain fast-evolving UCEs

# specifying species or clade in command line, (e.g. for i in `cat 93_avian_species.list`)
species=$1
cd {file_pathway}/$species

# get all.ACC.sc
cat $species.*.ACC.sc > $species.all.ACC.sc
cat $species.all.ACC.sc |grep "-"|sed 's/-//g' > all.ACC.sc

# calculate q value
R CMD BATCH {file_pathway}/qvalue.R;cat all.ACC.sc.qvalue.results |awk '$NF<0.05' > {file_pathway}/$species.ACC

## Optional step to get BED file

#for i in `cat {file_containing_species_or_clade_name}`;do les {file_pathway}/$i/$i.ACC|awk '{print $1"\t"$2"\t"$3}' > {file_pathway}/$i/$i.ACC.bed;done
