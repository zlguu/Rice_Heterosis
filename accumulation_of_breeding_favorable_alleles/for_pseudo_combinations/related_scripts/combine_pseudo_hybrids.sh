##$3 output file
grep -w $1 temp12 |sed s/\\t/\\n/g >ll1
grep -w $2 temp12 |sed s/\\t/\\n/g >ll2
paste ll1 ll2 >ll3
perl /data5/home/zlgu/revise_manuscript_for_2022Nature/model/combine_pseudo_hybrids.pl ll3 $3
