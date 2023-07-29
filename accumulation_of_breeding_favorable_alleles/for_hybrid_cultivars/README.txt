## Analyzing the total accumulation of breeding favorable alleles for hybrid cultivars

### For traits with high observation preferred by breeding practice, e.g yield per plant
sh accumulated_breeding_favourable_alleles_for_hybrid_cultivars_1.sh  *_stats.txt  pheno.file  *.vcf.gz
#### *_stats.txt   the output file of EMMAX
#### pheno.file format: ID\tID\tPheno
#### *.vcf.gz   vcf file including the variation information of hybrid cultivars


### For traits with low observation preferred by breeding practice, e.g gel consistency
sh accumulated_breeding_favourable_alleles_for_hybrid_cultivars_2.sh  *_stats.txt  pheno.file  *.vcf.gz
##$1 file:*_stats.txt (produced by EMMAX)
##$2 file:pheno     format:ID\tID\tPheno      
##$3 file:*.vcf.gz  vcf file inluding the variation information for hybrid cultivars



### processing scripts
./related_scripts/accumulated_GWAS_loci.pl
#### calculate the total accumulation of breeding favorable alleles     output format: ID\ttotal_accumulations
./related_scripts/GWAS_peak.pl
#### extract the peak SNP for every 500kb sliding window with step size 500kb.
./related_scripts/vcf_transform.pl
#### transform vcf file into the expected format
./related_scripts/average_phenotypes_of_3_genes.sh
#### calculate the average phenotypic value of 3 genotypes



### indica-indica hybrids in 3 breeding periods
./breeding_period/Y1.list.xian
./breeding_period/Y2.list.xian
./breeding_period/Y3.list.xian

