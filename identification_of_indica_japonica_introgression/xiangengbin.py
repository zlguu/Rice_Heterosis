#identification of japonica-introgression segements
##command_line: /data5/home/zhuzhou/script/python_script/xiangengbin.py prefix
####name_of_input:prefix.rlt
####records_in_input_file:the genotype(indica/indica, japonica/japonica, indica/japonica) of 80w indica-japonica differentiated markers
####format_for_input
######chr coor type 
######eg. 1 633336 ind
######eg. 1 6554738 jap
######eg. 1 646950 hetero
####name_of_output:prefix.bin
####records_in_output_file:the genotype of genomic sequence
####format_for_output
######chr\tstart_coor\tend_coor\ttype
######eg. 1\t1\t24776305\tind
######eg. 1\t24776306\t29468240\thetero
######eg. 8\t2845372\t4208657\tjap

import sys
index = sys.argv[1]
input_rlt = str(index)+".rlt"
#out_rlt=str(index)+".rlt"
out_bin=str(index)+".bin"
vcf_info = []

with open(input_rlt) as f:
    for lines in f.readlines():
        line = lines.strip().split(" ")
        vcf_info.append(line)

for i in vcf_info:
    for j in [0,0,0,0,0,0,0,0,0,0,0,0]:
        i.append(j)
        
read_number = len(vcf_info)


chrom = [0,0,0,0,0,0,0,0,0,0,0,0,0]
for i in range(1,len(vcf_info)):
    if vcf_info[i-1][0] == "1":
        chrom[1] += 1
    elif vcf_info[i-1][0] == "2":
        chrom[2] += 1
    elif vcf_info[i-1][0] == "3":
        chrom[3] += 1
    elif vcf_info[i-1][0] == "4":
        chrom[4] += 1
    elif vcf_info[i-1][0] == "5":
        chrom[5] += 1
    elif vcf_info[i-1][0] == "6":
        chrom[6] += 1
    elif vcf_info[i-1][0] == "7":
        chrom[7] += 1
    elif vcf_info[i-1][0] == "8":
        chrom[8] += 1
    elif vcf_info[i-1][0] == "9":
        chrom[9] += 1
    elif vcf_info[i-1][0] == "10":
        chrom[10] += 1
    elif vcf_info[i-1][0] == "11":
        chrom[11] += 1
    elif vcf_info[i-1][0] == "12":
        chrom[12] += 1


count=0
chromosome=[]
for i in range(13):
    count += chrom[i]
    chromosome.append(count)

win_size = 199
half_win_size = int(win_size/2)       

ind = 0
jap = 0
hetero = 0



for i in range(1,13):
    for j in range(chromosome[i-1] + half_win_size,chromosome[i] - half_win_size):
        for k in range(j - half_win_size,j + half_win_size + 1):
            if vcf_info[k][2]=="ind":
                ind += 1
            if vcf_info[k][2]=="jap":
                jap += 1
            if vcf_info[k][2]=="hetero":
                hetero += 1

            
            if max(ind,jap,hetero) == ind and ind >= 120:
                vcf_info[j][3]="ind"
                vcf_info[j][4]=ind
                vcf_info[j][5]=jap
                vcf_info[j][6]=hetero
            elif max(ind,jap,hetero) == jap and jap >= 120:
                vcf_info[j][3]="jap"
                vcf_info[j][4]=ind
                vcf_info[j][5]=jap
                vcf_info[j][6]=hetero
            elif max(ind,jap,hetero) == hetero and hetero >= 120:
                vcf_info[j][3]="hetero"
                vcf_info[j][4]=ind
                vcf_info[j][5]=jap
                vcf_info[j][6]=hetero


        ind=0
        jap=0
        hetero=0



for i in vcf_info:
    if i[3]  == 0:
        i[3] = "unknown"

raw = []
for i in range(0,chromosome[-1]):
    if vcf_info[i][3] != vcf_info[i+1][3] and vcf_info[i][0] == vcf_info[i+1][0] :
        point = int((int(vcf_info[i][1])+int(vcf_info[i+1][1]))/2)
        info = [vcf_info[i][0],vcf_info[i][3],point,vcf_info[i+1][3]]
        raw.append(info)
#for i in raw:
#    print(i)
    
final = []
my_dict = {'1':'43270923', '2':'35937250','3':'36413819','4':'35502694', '5':'29958434', '6':'31248787', '7':'29697621', '8':'28443022', '9':'23012720', '10':'23207287', '11':'29021106', '12':'27531856'}
for i in range(0,len(raw)-1):
    if i == 0:
        info = [raw[i][0],1,raw[i][2],raw[i][1]]
        final.append(info)
    if i == len(raw)-2:
        info = [raw[i+1][0],raw[i+1][2],int(my_dict[raw[i+1][0]]),raw[i+1][3]]
        final.append(info)
       
    elif raw[i][0] != raw[i+1][0]:
        info1 = [raw[i+1][0],1,raw[i+1][2],raw[i+1][1]]
        info2 = [raw[i][0],raw[i][2]+1,int(my_dict[raw[i][0]]),raw[i][3]]
        final.append(info1)
        final.append(info2)
    if raw[i][3] == raw[i+1][1] and raw[i][0] == raw[i+1][0]:
        info = [raw[i][0],raw[i][2]+1,raw[i+1][2],raw[i][3]]
        final.append(info)

raw1 = []        
for i in final:
    if int(i[2])-int(i[1]) > 300000 and i[3] != "unknown" and i[3] != 0:
        raw1.append(i)



sort = []
for i in raw1:
    if i[0]=="1":
        sort.append(i)
for i in raw1:
    if i[0]=="2":
        sort.append(i)
for i in raw1:
    if i[0]=="3":
        sort.append(i)
for i in raw1:
    if i[0]=="4":
        sort.append(i)
for i in raw1:
    if i[0]=="5":
        sort.append(i)
for i in raw1:
    if i[0]=="6":
        sort.append(i)
for i in raw1:
    if i[0]=="7":
        sort.append(i)
for i in raw1:
    if i[0]=="8":
        sort.append(i)
for i in raw1:
    if i[0]=="9":
        sort.append(i)
for i in raw1:
    if i[0]=="10":
        sort.append(i)
for i in raw1:
    if i[0]=="11":
        sort.append(i)
for i in raw1:
    if i[0]=="12":
        sort.append(i)

raw = []
for i in range(0,len(sort)-1):
    if sort[i][0] == sort[i+1][0] and sort[i][3] != sort[i+1][3]:
        info = [sort[i][0],sort[i][3],int((int(sort[i][2])+int(sort[i+1][1]))/2),sort[i+1][3]]
        raw.append(info)

#for i in raw:
#    print(i)


final = []
my_dict = {'1':43270923, '2':35937250,'3':36413819,'4':35502694, '5':29958434, '6':31248787, '7':29697621, '8':28443022, '9':23012720, '10':23207287, '11':29021106, '12':27531856}



for i in range(0,len(raw)-1):
    if i == 0:
        info = [raw[i][0],1,raw[i][2],raw[i][1]]
        final.append(info)
    if i == len(raw)-2 and raw[i][0] != raw [i+1][0]:
        info = [raw[i][0],raw[i][2]+1,my_dict[raw[i][0]],raw[i][3]]
        info1 = [raw[i+1][0],1,raw[i+1][2],raw[i+1][1]]
        info2 = [raw[i+1][0],raw[i+1][2]+1,my_dict[raw[i+1][0]],raw[i+1][3]]
        final.append(info)
        final.append(info1)
        final.append(info2)
    elif i == len(raw)-2 and raw[i][0] == raw [i+1][0] and raw[i][0] != raw[i-1][0]:
        info = [raw[i][0],1,raw[i][2],raw[i][1]]
        info1 = [raw[i][0],raw[i][2]+1,raw[i+1][2],raw[i][3]]
        info2 = [raw[i][0],raw[i+1][2]+1,my_dict[raw[i+1][0]],raw[i+1][3]]
        final.append(info)
        final.append(info1)
        final.append(info2)
    elif i == len(raw)-2 and raw[i][0] == raw [i+1][0] and raw[i][0] == raw[i-1][0]:
        info = [raw[i][0],raw[i-1][2]+1,raw[i][2],raw[i][1]]
        info1 = [raw[i][0],raw[i][2]+1,raw[i+1][2],raw[i][3]]
        info2 = [raw[i][0],raw[i+1][2]+1,my_dict[raw[i+1][0]],raw[i+1][3]]
        final.append(info)
        final.append(info1)
        final.append(info2)


    elif raw[i][0] != raw[i+1][0] and i <= len(raw)-3:
        info1 = [raw[i+1][0],1,raw[i+1][2],raw[i+1][1]]
        info2 = [raw[i][0],raw[i][2]+1,my_dict[raw[i][0]],raw[i][3]]
        final.append(info1)
        final.append(info2)
    elif raw[i][3] == raw[i+1][1] and raw[i][0] == raw[i+1][0] and i <= len(raw)-3:
        info = [raw[i][0],raw[i][2]+1,raw[i+1][2],raw[i][3]]
        final.append(info)

chr = []
for i in final:
    a = i[0]
    chr.append(a)

if "1" not in chr:
    for i in vcf_info:
        if i[0] == "1" and i[3] != "unknown": 
            info = ["1",1,my_dict['1'],i[3]]
            break
    final.append(info)
if "2" not in chr:
    for i in vcf_info:
        if i[0] == "2" and i[3] != "unknown":
            info = ["2",1,my_dict['2'],i[3]]
            break
    final.append(info)
if "3" not in chr:
    for i in vcf_info:
        if i[0] == "3" and i[3] != "unknown":
            info = ["3",1,my_dict['3'],i[3]]
            break
    final.append(info)
if "4" not in chr:
    for i in vcf_info:
        if i[0] == "4" and i[3] != "unknown":
            info = ["4",1,my_dict['4'],i[3]]
            break
    final.append(info)
if "5" not in chr:
    for i in vcf_info:
        if i[0] == "5" and i[3] != "unknown":
            info = ["5",1,my_dict['5'],i[3]]
            break
    final.append(info)
if "6" not in chr:
    for i in vcf_info:
        if i[0] == "6" and i[3] != "unknown":
            info = ["6",1,my_dict['6'],i[3]]
            break
    final.append(info)
if "7" not in chr:
    for i in vcf_info:
        if i[0] == "7" and i[3] != "unknown":
            info = ["7",1,my_dict['7'],i[3]]
            break
    final.append(info)
if "8" not in chr:
    for i in vcf_info:
        if i[0] == "8" and i[3] != "unknown":
            info = ["8",1,my_dict['8'],i[3]]
            break  
    final.append(info)
if "9" not in chr:
    for i in vcf_info:
        if i[0] == "9" and i[3] != "unknown":
            info = ["9",1,my_dict['9'],i[3]]
            break
    final.append(info)
if "10" not in chr:
    for i in vcf_info:
        if i[0] == "10" and i[3] != "unknown":
            info = ["10",1,my_dict['10'],i[3]]
            break
    final.append(info)
if "11" not in chr:
    for i in vcf_info:
        if i[0] == "11" and i[3] != "unknown":
            info = ["11",1,my_dict['11'],i[3]]
            break
    final.append(info)
if "12" not in chr:
    for i in vcf_info:
        if i[0] == "12" and i[3] != "unknown":
            info = ["12",1,my_dict['12'],i[3]]
            break
    final.append(info)

sort = []
for i in final:
    if i[0]=="1":
        sort.append(i)
for i in final:
    if i[0]=="2":
        sort.append(i)
for i in final:
    if i[0]=="3":
        sort.append(i)
for i in final:
    if i[0]=="4":
        sort.append(i)
for i in final:
    if i[0]=="5":
        sort.append(i)
for i in final:
    if i[0]=="6":
        sort.append(i)
for i in final:
    if i[0]=="7":
        sort.append(i)
for i in final:
    if i[0]=="8":
        sort.append(i)
for i in final:
    if i[0]=="9":
        sort.append(i)
for i in final:
    if i[0]=="10":
        sort.append(i)
for i in final:
    if i[0]=="11":
        sort.append(i)
for i in final:
    if i[0]=="12":
        sort.append(i)

finall = []
for i in sort:
    if i not in finall:
        finall.append(i)





output = open(out_bin,'w+')
for i in range(0,len(finall)):
    for j in range(len(finall[i])):
        output.write(str(finall[i][j]))
        output.write('\t')   
    output.write('\n')      
output.close()
