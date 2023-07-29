## extracting the annotation information produced by Snpeff software
sh 0_snpEff_annotation.sh $1
#### file:*.vcf  vcf file

## processing scripts
./snpeff_annotation_extract.pl


##the_format_of_outputfile
####chromosome\tcoordination\tAllele1\tthe_potential_effect_of_allele1\tAllele2\tthe_potential_effect_of_allele2......
