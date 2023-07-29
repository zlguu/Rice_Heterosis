##For_traits_with_low_observation_preferred_by_breeding_practice eg. chalkiness
##$1 file:*_stats.txt (produced by EMMAX)
##$2 file:pheno     format:ID\tID\tPheno      
##$3 file:*.vcf.gz  vcf file inluding the variation information for hybrid cultivars

awk 'BEGIN{OFS="\t"}{if(NR>=3)print	NR-2,$3,$4,$7}' $1 >temp1
grep -v "NaN" temp1 >temp1.tmp && mv temp1.tmp temp1
perl GWAS_peak.pl temp1 >temp2

sort -k 5g temp2 |head -100 |awk 'BEGIN{OFS="\t"}{if($1<=9)print "chr0"$1,$4,$5;else print "chr"$1,$4,$5}' >temp3
sort -k 5g temp2 |head -100 |awk 'BEGIN{OFS="\t"}{print	$1,$4}' >temp4
mv temp4 coor
cat coor |while	read id;do sh average_phenotypes_of_3_genos.sh $id $2 ;done >temp5
awk 'BEGIN{OFS="\t"}{if(NR%6==4)print	$2,$3}' temp5 >temp6
awk 'BEGIN{OFS="\t"}{if(NR%6==0)print	$2,$3}' temp5 >temp7
paste temp3 temp6 temp7 >temp8
grep -v "NA" temp8 |awk '{if($4>=5 && $6>=5)print}'|awk 'BEGIN{OFS="\t"}{if($5<$7)print $1,$2,$3,$5,$7,"0";else if($5>$7)print $1,$2,$3,$5,$7,"1"}' >temp9
awk 'BEGIN{OFS="\t"}{print $1,$2}' temp9 >temp10
vcftools --gzvcf $3 --positions temp10 --recode --recode-INFO-all --out temp1
perl vcf_transform.pl temp1.recode.vcf >temp11
rm temp12
for i in `seq $(head -n 1 temp11|awk '{print	NF}')`; do cut -f $i temp11 |tr "\n" "\t" |sed '$ s/$/\n/' >>temp12; done
grep -v "##" temp1.recode.vcf >temp13
perl accumulated_GWAS_loci.pl	temp13 temp9 temp12 >temp14

##########################################################################################
printf "Y1 <10 "
awk	'{print	$1}' Y1.list.xian |while read id; do awk -v value=$id '{if($1==value)print}' temp14 ;done |awk '{if($2<10)print}' |wc	-l
printf "Y1 >10 & <20 "
awk	'{print	$1}' Y1.list.xian |while read id;	do awk -v value=$id '{if($1==value)print}' temp14 ;done |awk '{if($2>=10 && $2<20)print}' |wc	-l
printf "Y1 >20 & <30 "
awk	'{print	$1}' Y1.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=20 && $2<30)print}'	|wc	-l												
printf "Y1 >30 & <40 "
awk	'{print	$1}' Y1.list.xian |while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=30 && $2<40)print}'	|wc	-l
printf "Y1 >40 & <50 "
awk	'{print	$1}' Y1.list.xian |while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=40 && $2<50)print}'	|wc	-l
printf "Y1 >50 & <60 "
awk	'{print	$1}' Y1.list.xian |while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=50 && $2<60)print}'	|wc	-l
printf "Y1 >60 & <70 "
awk	'{print	$1}' Y1.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=60 && $2<70)print}'	|wc	-l
printf "Y1 >70 & <80 "
awk	'{print	$1}' Y1.list.xian |while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=70 && $2<80)print}'	|wc	-l												
printf "Y1 >80 & <90 "
awk	'{print	$1}' Y1.list.xian |while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=80 && $2<90)print}'	|wc	-l
printf "Y1 >90 & <100 "
awk	'{print	$1}' Y1.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=90 && $2<100)print}'	|wc	-l
printf "Y1 >100 & <110 "
awk	'{print	$1}' Y1.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=100 && $2<110)print}'	|wc	-l
printf "Y1 >110 & <120 "
awk	'{print	$1}' Y1.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=110 && $2<120)print}'	|wc	-l
printf "Y1 >120 & <130 "
awk	'{print	$1}' Y1.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=120 && $2<130)print}'	|wc	-l
printf "Y1 >130 & <140 "
awk	'{print	$1}' Y1.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=130 && $2<140)print}'	|wc	-l
printf "Y1 >140 & <150 "
awk	'{print	$1}' Y1.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=140 && $2<150)print}'	|wc	-l												
##########################################################################################
printf "Y2 <10 "
awk	'{print	$1}' Y2.list.xian	|while read id; do awk -v value=$id '{if($1==value)print}' temp14 ;done |awk '{if($2<10)print}' |wc	-l
printf "Y2 >10 & <20 "
awk	'{print	$1}' Y2.list.xian |while read id;	do awk -v value=$id '{if($1==value)print}' temp14 ;done |awk '{if($2>=10 && $2<20)print}' |wc	-l
printf "Y2 >20 & <30 "
awk	'{print	$1}' Y2.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=20 && $2<30)print}'	|wc	-l												
printf "Y2 >30 & <40 "
awk	'{print	$1}' Y2.list.xian |while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=30 && $2<40)print}'	|wc	-l
printf "Y2 >40 & <50 "
awk	'{print	$1}' Y2.list.xian |while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=40 && $2<50)print}'	|wc	-l
printf "Y2 >50 & <60 "
awk	'{print	$1}' Y2.list.xian |while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=50 && $2<60)print}'	|wc	-l
printf "Y2 >60 & <70 "
awk	'{print	$1}' Y2.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=60 && $2<70)print}'	|wc	-l
printf "Y2 >70 & <80 "
awk	'{print	$1}' Y2.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=70 && $2<80)print}'	|wc	-l												
printf "Y2 >80 & <90 "
awk	'{print	$1}' Y2.list.xian |while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=80 && $2<90)print}'	|wc	-l
printf "Y2 >90 & <100 "
awk	'{print	$1}' Y2.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=90 && $2<100)print}'	|wc	-l
printf "Y2 >100 & <110 "
awk	'{print	$1}' Y2.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=100 && $2<110)print}'	|wc	-l
printf "Y2 >110 & <120 "
awk	'{print	$1}' Y2.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=110 && $2<120)print}'	|wc	-l
printf "Y2 >120 & <130 "
awk	'{print	$1}' Y2.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=120 && $2<130)print}'	|wc	-l
printf "Y2 >130 & <140 "
awk	'{print	$1}' Y2.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=130 && $2<140)print}'	|wc	-l
printf "Y2 >140 & <150 "
awk	'{print	$1}' Y2.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=140 && $2<150)print}'	|wc	-l		
##########################################################################################
printf "Y3 <10 "
awk	'{print	$1}' Y3.list.xian	|while read id; do awk -v value=$id '{if($1==value)print}' temp14 ;done |awk '{if($2<10)print}' |wc	-l
printf "Y3 >10 & <20 "
awk	'{print	$1}' Y3.list.xian |while read id;	do awk -v value=$id '{if($1==value)print}' temp14 ;done |awk '{if($2>=10 && $2<20)print}' |wc	-l
printf "Y3 >20 & <30 "
awk	'{print	$1}' Y3.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=20 && $2<30)print}'	|wc	-l												
printf "Y3 >30 & <40 "
awk	'{print	$1}' Y3.list.xian |while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=30 && $2<40)print}'	|wc	-l
printf "Y3 >40 & <50 "
awk	'{print	$1}' Y3.list.xian |while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=40 && $2<50)print}'	|wc	-l
printf "Y3 >50 & <60 "
awk	'{print	$1}' Y3.list.xian |while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=50 && $2<60)print}'	|wc	-l
printf "Y3 >60 & <70 "
awk	'{print	$1}' Y3.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=60 && $2<70)print}'	|wc	-l
printf "Y3 >70 & <80 "
awk	'{print	$1}' Y3.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=70 && $2<80)print}'	|wc	-l												
printf "Y3 >80 & <90 "
awk	'{print	$1}' Y3.list.xian |while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=80 && $2<90)print}'	|wc	-l
printf "Y3 >90 & <100 "
awk	'{print	$1}' Y3.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=90 && $2<100)print}'	|wc	-l
printf "Y3 >100 & <110 "
awk	'{print	$1}' Y3.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=100 && $2<110)print}'	|wc	-l
printf "Y3 >110 & <120 "
awk	'{print	$1}' Y3.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=110 && $2<120)print}'	|wc	-l
printf "Y3 >120 & <130 "
awk	'{print	$1}' Y3.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=120 && $2<130)print}'	|wc	-l
printf "Y3 >130 & <140 "
awk	'{print	$1}' Y3.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=130 && $2<140)print}'	|wc	-l
printf "Y3 >140 & <150 "
awk	'{print	$1}' Y3.list.xian	|while read id;	do awk -v value=$id '{if($1==value)print}' temp14	;done |awk '{if($2>=140 && $2<150)print}'	|wc	-l	