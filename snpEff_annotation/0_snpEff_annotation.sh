##Snpeff_annotation
java -jar snpEff.jar -i vcf -o vcf Oryza_sativa a.vcf >a_snpeff.vcf
##Extract_annotation_information
perl snpeff_annotation_extract.pl a_snpeff.vcf >a_snpeff.annotation
##the_format_of_outputfile: chromosome\tcoordination\tAllele1\tthe_potential_effect_of_allele1\tAllele2\tthe_potential_effect_of_allele2......