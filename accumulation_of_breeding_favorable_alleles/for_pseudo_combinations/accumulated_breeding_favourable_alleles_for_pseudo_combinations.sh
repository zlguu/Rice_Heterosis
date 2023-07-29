##For_traits_with_high_observation_preferred_by_breeding_practice eg. yield_per_plant
##$1 file:*_stats.txt (produced by EMMAX)
##$2 functional_variations     e.g SSR_functional_variations_c.txt
##$3 file:pheno     format:ID\tID\tPheno      
##$4 file:*.vcf.gz  vcf file inluding the variation information for parents
##$5 parent         list for pseudo-combinations
##$6 pseudo-combinations list

awk 'BEGIN{OFS="\t"}{if(NR>=3)print	NR-2,$3,$4,$7}' $1 >temp1
grep -v "NaN" temp1 >temp1.tmp && mv temp1.tmp temp1
perl GWAS_peak.pl temp1 >temp2

sort -k 5g temp2 |head -100 |awk 'BEGIN{OFS="\t"}{if($1<=9)print "chr0"$1,$4,$5;else print "chr"$1,$4,$5}' >temp3
awk 'BEGIN{OFS="\t"}{print $1,$2,"NA"}' $2 > $2.a
cat temp3 $2.a >temp3.1

sort -k 5g temp2 |head -100 |awk 'BEGIN{OFS="\t"}{print	$1,$4}' >temp4
mv temp4 coor
cat coor $2 >total.coor

cat total.coor|while read id; do sh average_phenotypes_of_3_genos.sh $id $3 ;done >temp5        
awk 'BEGIN{OFS="\t"}{if(NR%6==4)print	$2,$3}' temp5 >temp6
awk 'BEGIN{OFS="\t"}{if(NR%6==0)print	$2,$3}' temp5 >temp7
paste temp3.1 temp6 temp7 >temp8
awk '{if($4>=5 && $6>=5 && $4!="NA" && $6!="NA")print}' temp8|awk 'BEGIN{OFS="\t"}{if($5<=$7)print $1,$2,$5,$7,"1";else if($5>$7)print $1,$2,$5,$7,"0"}' >temp9 
awk 'BEGIN{OFS="\t"}{print $1,$2}' temp9 >temp10

vcftools --gzvcf $4 --keep $5 --positions temp10 --recode --recode-INFO-all --out temp1
perl vcf_transform.pl temp1.recode.vcf >temp11
rm temp12
for i in `seq $(head -n 1 temp11|awk '{print	NF}')`; do cut -f $i temp11 |tr "\n" "\t" |sed '$ s/$/\n/' >>temp12; done
rm temp13
cat $6 |while read id;do sh combine_pseudo_hybrids.sh $id temp13;done
grep -v "##" temp1.recode.vcf >temp14
perl accumulated_superior_loci.pl	temp14 temp9 temp13 >temp15
###############################################################################################################################
printf "<10 "
awk '{if($2<10)print}' temp15|wc -l
printf ">=10 & <20 "
awk '{if($2>=10 && $2<20)print}' temp15|wc -l 
printf ">=20 & <30 "
awk '{if($2>=20 && $2<30)print}' temp15|wc -l 
printf ">=30 & <40 "
awk '{if($2>=30 && $2<40)print}' temp15|wc -l   
printf ">=40 & <50 "
awk '{if($2>=40 && $2<50)print}' temp15|wc -l  
printf ">=50 & <60 "
awk '{if($2>=50 && $2<60)print}' temp15|wc -l   
printf ">=60 & <70 "
awk '{if($2>=60 && $2<70)print}' temp15|wc -l   
printf ">=70 & <80 "
awk '{if($2>=70 && $2<80)print}' temp15|wc -l   
printf ">=80 & <90 "
awk '{if($2>=80 && $2<90)print}' temp15|wc -l   
printf ">=90 & <100 "
awk '{if($2>=90 && $2<100)print}' temp15|wc -l   
printf ">=100 & <110 "
awk '{if($2>=100 && $2<110)print}' temp15|wc -l   
printf ">=110 & <120 "
awk '{if($2>=110 && $2<120)print}' temp15|wc -l   
printf ">=120 & <130 "
awk '{if($2>=120 && $2<130)print}' temp15|wc -l   
printf ">=130 & <140 "
awk '{if($2>=130 && $2<140)print}' temp15|wc -l   
printf ">=140 & <150 "
awk '{if($2>=140 && $2<150)print}' temp15|wc -l  

