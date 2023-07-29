import sys
in1 = sys.argv[1]
ou1 = sys.argv[2]
#vcf_info1 = []
#with open("/data5/home/zhuzhou/zlgutest/zahedu/zonghe_loci") as f:
#    for lines in f.readlines():
#        line = lines.strip().split("\t")
#        vcf_info1.append(line)

vcf_info2 = []
with open(in1) as f:
    for lines in f.readlines():
        line = lines.strip().split("\t")
        vcf_info2.append(line)

#tmp = []
#for i in vcf_info1:
#    for j in vcf_info2:
#        if j[0] == i[0] and int(j[1]) >= int(i[1]) and int(j[1]) <= int(i[2]):
#            info = [j[0],j[1],j[4]]
#            tmp.append(info)

final = []
for i in vcf_info2:
    if i[4] == "00":
        info = "-1"
        final.append(info)
    elif i[4] == "01":
        info = "0"
        final.append(info)
    elif i[4] == "11":
        info = "1"      
        final.append(info)
    else :
        info = "NA"
        final.append(info)


output = open(ou1,'w+')
for i in range(0,len(final)):
    output.write(str(final[i]))
    output.write(' ')   
output.write('\n')      
output.close()
