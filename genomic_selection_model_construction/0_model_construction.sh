Rscript GEBV.R
echo id YD VPN SSR GNP PH HD LWR > 1102.pheno 
paste danzhuchanliang.txt youxiaosuishu.txt jieshilv.txt meisuilishu.txt zhugao.txt chousuiqi.txt changbikuan.txt |grep -v np|grep -v Z|grep -v mix|awk '{print $1,$3,$6,$9,$12,$15,$18,$21}' >> 1102.pheno
python selectionindex2.py