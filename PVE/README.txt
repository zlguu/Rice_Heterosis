## calculating the phenotypic variance explained (PVE) by candidate region in indica-indica hybrid population
## step1
sh 1_Producing_sommer_format_inputfile.sh $1 $2 $3
####$1 file:*.vcf                    vcf file containing the genotype information of indica-indica hybrids
####$2 parameter:candidate_region    e.g. 6:1256454-2256454 (1Mb in our job)
####$3 file:phenotype                format: ID\tID\tPheno
## step2
Rscript  2_Calculating_PVE_by_sommer.R  pheno.a
####$1 pheno.a                       producred by step 1


## processing scripts
./vcf_to_sommer_Amat_format.pl
#### transform vcf into the format compatible to Amat in sommer
./vcf_to_sommer_Dmat_format.pl
#### transform vcf into the format compatible to Dmat in sommer
