#calculation of selection index
##name_of_input_file:1102.pheno
##records_in_input_file:GEBV_of_seven_trait
##format_for_input
####id YD VPN SSR GNP PH HD LWR
####GS37_20M22 26.0495244285157 10.2036042082274 0.363242339486564 106.029926849408 112.643174699476 104.72303112919 4.02231723070171
####GS37_20M66 28.1685289143474 8.87775119020695 0.466621485017187 132.622525126037 115.350767446174 97.2666251044435 4.16995479483398
##name_of_output_file:score2.txt
##records_in_output_file:score_of_every_combination
##format_for_output
####id\tscore
####20M10_20F100\t60.714285714285715
####20M10_20F101\t50.0


import numpy as np
######################################Load data
data = np.loadtxt("1102.pheno",dtype="str")
YD=[]
for i in data[1:,]:
    YD.append(float(i[1]))
    
VPN=[]
for i in data[1:,]:
    VPN.append(float(i[2]))
    
SSR=[]
for i in data[1:,]:
    SSR.append(float(i[3]))
    
GNP=[]
for i in data[1:,]:
    GNP.append(float(i[4]))
    
PH=[]
for i in data[1:,]:
    PH.append(float(i[5]))
    
HD=[]
for i in data[1:,]:
    HD.append(float(i[6]))
    
LWR=[]
for i in data[1:,]:
    LWR.append(float(i[7]))


infoo = []
score = 0

#################################Yield per plant score
for i in data[1:,]:
    if float(i[1]) >= np.percentile(YD,80):
        score += 40
    elif float(i[1]) >= np.percentile(YD,60) and float(i[1]) < np.percentile(YD,80):
        score += 30
    elif float(i[1]) >= np.percentile(YD,40) and float(i[1]) < np.percentile(YD,60):
        score += 20
    elif float(i[1]) >= np.percentile(YD,20) and float(i[1]) < np.percentile(YD,40):
        score += 10
    elif float(i[1]) < np.percentile(YD,20):
        score += 0

################################Valid panicle number score        
    if float(i[2]) >= np.percentile(VPN,80):
        score += 40
    elif float(i[2]) >= np.percentile(VPN,60) and float(i[2]) < np.percentile(VPN,80):
        score += 30
    elif float(i[2]) >= np.percentile(VPN,40) and float(i[2]) < np.percentile(VPN,60):
        score += 20
    elif float(i[2]) >= np.percentile(VPN,20) and float(i[2]) < np.percentile(VPN,40):
        score += 10
    elif float(i[2]) < np.percentile(VPN,20):
        score += 0

        
##################################Seed setting rate score
    if float(i[3]) >= np.percentile(SSR,80):
        score += 60
    elif float(i[3]) >= np.percentile(SSR,60) and float(i[3]) < np.percentile(SSR,80):
        score += 50
    elif float(i[3]) >= np.percentile(SSR,40) and float(i[3]) < np.percentile(SSR,60):
        score += 40
    elif float(i[3]) >= np.percentile(SSR,20) and float(i[3]) < np.percentile(SSR,40):
        score += 30
    elif float(i[3]) < np.percentile(SSR,20):
        score += 20


#############################################Full grain numbers per panicle score 
    if float(i[4]) >= np.percentile(GNP,80):
        score += 40
    elif float(i[4]) >= np.percentile(GNP,60) and float(i[4]) < np.percentile(GNP,80):
        score += 30
    elif float(i[4]) >= np.percentile(GNP,40) and float(i[4]) < np.percentile(GNP,60):
        score += 20
    elif float(i[4]) >= np.percentile(GNP,20) and float(i[4]) < np.percentile(GNP,40):
        score += 10
    elif float(i[4]) < np.percentile(GNP,20):
        score += 0
        
###########################################Plant height score
    if float(i[5]) >= np.percentile(PH,70) and float(i[5]) < np.percentile(PH,95):
        score += 20
    elif float(i[5]) >= np.percentile(PH,20) and float(i[5]) < np.percentile(PH,40):
        score += 20
    elif float(i[5]) >= np.percentile(PH,40) and float(i[5]) < np.percentile(PH,70):
        score += 40
    elif float(i[5]) >= np.percentile(PH,95) :
        score += 10
    elif float(i[5]) < np.percentile(PH,20):
        score += 10


#############################################Heading date score
    if float(i[6]) >= np.percentile(HD,70) and float(i[6]) < np.percentile(HD,95):
        score += 30
    elif float(i[6]) >= np.percentile(HD,30) and float(i[6]) < np.percentile(HD,70):
        score += 40
    elif float(i[6]) >= np.percentile(HD,95):
        score += 20
    elif float(i[6]) < np.percentile(HD,30):
        score += 20

#####################################Grain shape score
    if float(i[7]) >= np.percentile(LWR,80) and float(i[7]) < np.percentile(LWR,90):
        score += 30
    elif float(i[7]) >= np.percentile(LWR,40) and float(i[7]) < np.percentile(LWR,80):
        score += 40
    elif float(i[7]) >= np.percentile(LWR,90) :
        score += 10
    elif float(i[7]) < np.percentile(LWR,40):
        score += 10



    info = [i[0],str(score)]
    infoo.append(info)
    score = 0


############################Sum scale, highest total score is 100
fi = []
for i in infoo:
    info = [i[0],int(i[1])/3]
    fi.append(info)


####################################Output file
output = open("score2.txt",'w+')
for i in range(0,len(fi)):
    for j in range(len(fi[i])):
        output.write(str(fi[i][j]))
        output.write('\t')   
    output.write('\n')      
output.close()
