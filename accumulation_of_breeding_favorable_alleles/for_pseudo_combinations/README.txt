## Analyzing the total accumulation of breeding favorable alleles for pseudo-combinations
sh accumulated_breeding_favourable_alleles_for_pseudo_combinations.sh  *_stats.txt  functional_variations  pheno.file  *.vcf.gz list_of_parents list_of_pseudo_combinations
#### *_stats.txt                 the output file of EMMAX
#### functional_variations       e.g SSR_functional_variations_c.txt
#### pheno.file                  format: ID\tID\tPheno
#### *.vcf.gz                    vcf file including the variation information for parents
#### list_of_parents             e.g WA_male_female_top10.txt
#### list_of_pseudo-combinations e.g WA_top10.list



### processing scripts
./related_scripts/accumulated_superior_loci.pl
#### calculate the total accumulation of breeding favorable alleles in pseudo-combinations     output format: ID\ttotal_accumulations
./related_scripts/GWAS_peak.pl
#### extract the peak SNP for every 500kb sliding window with step size 500kb.
./related_scripts/vcf_transform.pl
#### transform vcf file into the expected format
./related_scripts/average_phenotypes_of_3_genes.sh
#### calculate the average phenotypic value of 3 genotypes
./related_scripts/combine_pseudo_hybrids.sh   &&    ./related_scripts/combine_pseudo_hybrids.pl
#### produce the genotype of pseudo-combinations according to genotype in both parental lines



### functional variations
./related_file/GNP_functional_variations_c.txt
./related_file/SSR_functional_variations_c.txt
./related_file/YD_component_functional_variation_c.txt

### list of parents
./related_file/WA_male_female_random.txt
./related_file/WA_male_female_top10.txt

### list of pseudo-combinations
./related_file/WA_random.list
./related_file/WA_top10.list

