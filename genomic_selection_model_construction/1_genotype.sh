## producing genotype file for a single sample
####$1 file:*.vcf
####$2 the_column_number_of_target_sample_in_vcf_file  eg. 10
####$3 sample ID
awk '{print $0}' $1|grep -v \#|awk -v value=$2 '{print $1,$2,$4,$5,$value}'|awk '{print $1,$2,$3,$4,substr($5,1,3)}'|sed s#\|##g |sed s#/##g |sed s/chr0//g|sed s/chr//g|sed s/\\s/\\t/g> $3.snp
python gblup_pre.py $3.snp $3.snp.geno

