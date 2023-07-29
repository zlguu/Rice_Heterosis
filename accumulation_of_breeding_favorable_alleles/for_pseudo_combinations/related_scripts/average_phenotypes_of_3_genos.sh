if (($1<=9))
  then
  zcat /data5/home/zhuzhou/heterosis_parent/total_vcf_db/total_chr0$1.vcf.gz |head -100 |grep "#CHROM" | sed s/\\t/\\n/g >temp1.txt
  tabix /data5/home/zhuzhou/heterosis_parent/total_vcf_db/total_chr0$1.vcf.gz chr0$1:$2-$2 |awk -v value=$2 '{if($2==value)print}' |sed s/\\t/\\n/g >temp2.txt
  else
  zcat /data5/home/zhuzhou/heterosis_parent/total_vcf_db/total_chr$1.vcf.gz |head -100 |grep "#CHROM" | sed s/\\t/\\n/g >temp1.txt
  tabix /data5/home/zhuzhou/heterosis_parent/total_vcf_db/total_chr$1.vcf.gz chr$1:$2-$2 |awk -v value=$2 '{if($2==value)print}' |sed s/\\t/\\n/g >temp2.txt  
fi

paste temp1.txt temp2.txt >temp3.txt
sed -n '4,5p' temp3.txt
printf "$1\t$2\n";
awk '{print $1}' /data6/home/zlgu/time/2724_ind_ind |while read id;do awk -v value=$id '{if($1==value)print}' temp3.txt ;done | awk '{split($2,a,":");if($2~/\|/){split(a[1],b,"|");print $1"\t"b[1]""b[2]}else if($2~/\//){split(a[1],b,"/");print $1"\t"b[1]b[2]}}' >temp4.txt 
printf "0/0\t"
awk '{if($2==00)print $1}' temp4.txt |while read id;do awk -v value=$id '{if($1==value)print $3}' $3; done >aa && awk 'BEGIN{OFS="\t"}{if($1!="NA" && $1!=""){sum+=$1;aa+=1}}END{if(aa!=0)print aa,sum/aa;else print 0,"NA"}' aa
printf "0/1\t"
awk '{if($2==01)print $1}' temp4.txt |while read id;do awk -v value=$id '{if($1==value)print $3}' $3; done >aa && awk 'BEGIN{OFS="\t"}{if($1!="NA" && $1!=""){sum+=$1;aa+=1}}END{if(aa!=0)print aa,sum/aa;else print 0,"NA"}' aa
printf "1/1\t"
awk '{if($2==11)print $1}' temp4.txt |while read id;do awk -v value=$id '{if($1==value)print $3}' $3; done >aa && awk 'BEGIN{OFS="\t"}{if($1!="NA" && $1!=""){sum+=$1;aa+=1}}END{if(aa!=0)print aa,sum/aa;else print 0,"NA"}' aa

