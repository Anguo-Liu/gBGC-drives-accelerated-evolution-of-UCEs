#calculate p value
species=$1

cd {file_pathway}/$species/Rscript/
python pvalue1_GC.py {file_pathway}/$species.count.merge.GC.more one_line
cd ../../
