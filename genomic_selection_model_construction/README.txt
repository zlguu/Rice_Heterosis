## constructing the genomic selection model
step1 produce the genotype file
sh 1_genotype.sh $1 $2 $3
cat *snp.geno > all.geno
####$1 file:*.vcf
####$2 the_column_number_of_target_sample_in_vcf_file  eg. 10
####$3 sample ID                                       eg. ZJM1000
step2 model construction based on GBLUP and calculation of selection index
sh 2_model_construction.sh

## test file
./test_file/all_test.geno
####genotype file
./test_file/all_test.pheno
####phenotype file

## processing scripts
./related_scripts/gblup_pre.py
#### transform genotype file into the format compatible to GBLUP
./related_scripts/GEBV.R
#### constructing a model to calculate GEBV(Genomic Estimated Breeding Value)
./related_scripts/selectionindex.py
#### calculating selection index

