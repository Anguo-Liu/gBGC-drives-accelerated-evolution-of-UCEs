#get conserved and variable sites within pairwise aligned UCEs
species=$1

cd {file_pathway}/$species

perl {file_pathway}/0-{Avian_or_Mammal}.getConservedSite.pl {file_pathway}/$species/$species.list {file_pathway}/$species_UCE_pairwise.last.maf $species.inf $species.pos
