##$1 file:*.vcf
##$2 parameter:candidate_region    e.g. 6:25263756-25763756
##$3 file:pheno                    format: ID\tID\tPheno
##$4 file:output                   format: ID\tID\tPheno
grep -v "#" $1 |	awk	'{if(NR%10==1)print}'	>temp1
grep "#" $1 >head.txt
cat head.txt temp1 >a.vcf
bgzip	a.vcf
tabix -p vcf a.vcf.gz
tabix a.vcf.gz $2 >target
cat head.txt target >target.vcf
perl vcf_to_sommer_Amat_format.pl target.vcf >targetA.sommer
perl vcf_to_sommer_Dmat_format.pl target.vcf >targetD.sommer
awk 'BEGIN{OFS="\t"}{print $1,$2}' target >target_loi 
vcftools --gzvcf a.vcf.gz --exclude-positions target_loi --recode --recode-INFO-all --out untarget
perl vcf_to_sommer_Amat_format.pl untarget.recode.vcf >untargetA.sommer
perl vcf_to_sommer_Dmat_format.pl untarget.recode.vcf >untargetD.sommer
grep "#CHROM" untarget.recode.vcf |sed s/\\t/\\n/g >sample.list
cat sample.list |while read id;do awk -v value=$id 'BEGIN{OFS="\t"}{if($1==value)print $1,$1,$1,$1,$3}' $3 ;done >$4
