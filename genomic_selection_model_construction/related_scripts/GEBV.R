library(sommer)
args=commandArgs(T)
DT = read.table("all_test.pheno",header = T,row.names = 1)
GT = read.table("all_test.geno",row.names = 1,header = F)
GT = as.matrix(GT)
A = A.mat(GT)
DT$id <- DT$idd
D <- D.mat(GT) # dominance relationship matrix
mix1 <- mmer(danzhuchanliang~1,
             random=~vs(id,Gu=A),
             rcov=~units,
             data=DT, verbose = FALSE)
mm <- matrix(3,1,1)
mix2 <- mmer(danzhuchanliang~1,
             random=~vs(id, Gu=A, Gti=mix1$sigma_scaled$`u:id`, Gtc=mm)
             + vs(idd, Gu=D, Gtc=unsm(1)),
             rcov=~vs(units,Gti=mix1$sigma_scaled$units, Gtc=mm),
             data=DT, verbose = FALSE)
aab = as.data.frame(mix2$U$`u:id`$danzhuchanliang)
aab$"out" = aab$"mix2$U$`u:id`$danzhuchanliang" + mix2[["Beta"]][["Estimate"]]
write.table(aab,"danzhuchanliang.txt",row.names = T,quote = F)
#####################################################################################################
mix1 <- mmer(chousuiqi~1,
             random=~vs(id,Gu=A),
             rcov=~units,
             data=DT, verbose = FALSE)
mm <- matrix(3,1,1)
mix2 <- mmer(chousuiqi~1,
             random=~vs(id, Gu=A, Gti=mix1$sigma_scaled$`u:id`, Gtc=mm)
             + vs(idd, Gu=D, Gtc=unsm(1)),
             rcov=~vs(units,Gti=mix1$sigma_scaled$units, Gtc=mm),
             data=DT, verbose = FALSE)
aab = as.data.frame(mix2$U$`u:id`$chousuiqi)
aab$"out" = aab$"mix2$U$`u:id`$chousuiqi" + mix2[["Beta"]][["Estimate"]]
write.table(aab,"chousuiqi.txt",row.names = T,quote = F)
######################################################################################################
mix1 <- mmer(changbikuan~1,
             random=~vs(id,Gu=A),
             rcov=~units,
             data=DT, verbose = FALSE)
mm <- matrix(3,1,1)
mix2 <- mmer(changbikuan~1,
             random=~vs(id, Gu=A, Gti=mix1$sigma_scaled$`u:id`, Gtc=mm)
             + vs(idd, Gu=D, Gtc=unsm(1)),
             rcov=~vs(units,Gti=mix1$sigma_scaled$units, Gtc=mm),
             data=DT, verbose = FALSE)
aab = as.data.frame(mix2$U$`u:id`$changbikuan)
aab$"out" = aab$"mix2$U$`u:id`$changbikuan" + mix2[["Beta"]][["Estimate"]]
write.table(aab,"changbikuan.txt",row.names = T,quote = F)
######################################################################################################
mix1 <- mmer(jieshilv~1,
             random=~vs(id,Gu=A),
             rcov=~units,
             data=DT, verbose = FALSE)
mm <- matrix(3,1,1)
mix2 <- mmer(jieshilv~1,
             random=~vs(id, Gu=A, Gti=mix1$sigma_scaled$`u:id`, Gtc=mm)
             + vs(idd, Gu=D, Gtc=unsm(1)),
             rcov=~vs(units,Gti=mix1$sigma_scaled$units, Gtc=mm),
             data=DT, verbose = FALSE)
aab = as.data.frame(mix2$U$`u:id`$jieshilv)
aab$"out" = aab$"mix2$U$`u:id`$jieshilv" + mix2[["Beta"]][["Estimate"]]
write.table(aab,"jieshilv.txt",row.names = T,quote = F)
######################################################################################################
mix1 <- mmer(meisuilishu~1,
             random=~vs(id,Gu=A),
             rcov=~units,
             data=DT, verbose = FALSE)
mm <- matrix(3,1,1)
mix2 <- mmer(meisuilishu~1,
             random=~vs(id, Gu=A, Gti=mix1$sigma_scaled$`u:id`, Gtc=mm)
             + vs(idd, Gu=D, Gtc=unsm(1)),
             rcov=~vs(units,Gti=mix1$sigma_scaled$units, Gtc=mm),
             data=DT, verbose = FALSE)
aab = as.data.frame(mix2$U$`u:id`$meisuilishu)
aab$"out" = aab$"mix2$U$`u:id`$meisuilishu" + mix2[["Beta"]][["Estimate"]]
write.table(aab,"meisuilishu.txt",row.names = T,quote = F)
######################################################################################################
mix1 <- mmer(qianlizhong~1,
             random=~vs(id,Gu=A),
             rcov=~units,
             data=DT, verbose = FALSE)
mm <- matrix(3,1,1)
mix2 <- mmer(qianlizhong~1,
             random=~vs(id, Gu=A, Gti=mix1$sigma_scaled$`u:id`, Gtc=mm)
             + vs(idd, Gu=D, Gtc=unsm(1)),
             rcov=~vs(units,Gti=mix1$sigma_scaled$units, Gtc=mm),
             data=DT, verbose = FALSE)
aab = as.data.frame(mix2$U$`u:id`$qianlizhong)
aab$"out" = aab$"mix2$U$`u:id`$qianlizhong" + mix2[["Beta"]][["Estimate"]]
write.table(aab,"qianlizhong.txt",row.names = T,quote = F)
######################################################################################################
mix1 <- mmer(youxiaosuishu~1,
             random=~vs(id,Gu=A),
             rcov=~units,
             data=DT, verbose = FALSE)
mm <- matrix(3,1,1)
mix2 <- mmer(youxiaosuishu~1,
             random=~vs(id, Gu=A, Gti=mix1$sigma_scaled$`u:id`, Gtc=mm)
             + vs(idd, Gu=D, Gtc=unsm(1)),
             rcov=~vs(units,Gti=mix1$sigma_scaled$units, Gtc=mm),
             data=DT, verbose = FALSE)
aab = as.data.frame(mix2$U$`u:id`$youxiaosuishu)
aab$"out" = aab$"mix2$U$`u:id`$youxiaosuishu" + mix2[["Beta"]][["Estimate"]]
write.table(aab,"youxiaosuishu.txt",row.names = T,quote = F)
######################################################################################################
mix1 <- mmer(zhugao~1,
             random=~vs(id,Gu=A),
             rcov=~units,
             data=DT, verbose = FALSE)
mm <- matrix(3,1,1)
mix2 <- mmer(zhugao~1,
             random=~vs(id, Gu=A, Gti=mix1$sigma_scaled$`u:id`, Gtc=mm)
             + vs(idd, Gu=D, Gtc=unsm(1)),
             rcov=~vs(units,Gti=mix1$sigma_scaled$units, Gtc=mm),
             data=DT, verbose = FALSE)
aab = as.data.frame(mix2$U$`u:id`$zhugao)
aab$"out" = aab$"mix2$U$`u:id`$zhugao" + mix2[["Beta"]][["Estimate"]]
write.table(aab,"zhugao.txt",row.names = T,quote = F)
######################################################################################################