##$1 file:*.vcf
##$2 the_column_number_of_target_sample_in_vcf_file  eg. 23 
awk '{if($1~/^chr/)print $0}' $1 |awk -v value=$2 '{print $1"_"$2,$1,$2,$4,$5,$value}'|sed "s/chr0\|chr//g"|awk '{print $1,$2,$3,$4,$5,substr($6,1,3)}'|sed s#\|##g |sed s#/##g|grep -v \\.|sed s/\\s/\\t/g  > a.snp
awk 'NR==FNR{a[$1]=$0;next}NR>FNR{if($1 in a)print a[$1]" "$0}' a.snp indica_japonica_differentiated.snp |awk '{print $2,$3,$4,$5,$6,$10,$11}' |awk '{if($5=="00"){print $1,$2,$3,$6,$7}else if($5=="11"){print $1,$2,$4,$6,$7}else if($5=="01"){print $1,$2,"01",$6,$7}}'|sed s/\\s/\\t/g > a.snp.tmp
awk '{if($3==01){print $1,$2,"hetero"}else if($3==$4){print $1,$2,"ind"}else if($3==$5){print $1,$2,"jap"}}' a.snp.tmp > a.rlt
python xiangengbin.py a
