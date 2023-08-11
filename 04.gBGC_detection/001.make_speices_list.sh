#get a species list containing two names (including Avian_ance/Mammal_ance and a Avian/Mammalian species)

for i in `cat {file_pathway}/species_list`;do cd {file_pathway}/$i;echo $i|awk '{print $1"\t"1}'|sed '1i {Avain_ance_or_Mammal_ance}\t2' > {file_pathway}/$i/$i.list;done
