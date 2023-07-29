##Snpeff_annotation
java -jar snpEff.jar -i vcf -o vcf Oryza_sativa $1 >a_snpeff.vcf
##Extract_annotation_information
perl snpeff_annotation_extract.pl a_snpeff.vcf >a_snpeff.annotation
