##args1[1]==phenotype_file $4_in_producing_sommer_format.sh
args<-commandArgs(trailingOnly=T)
library(sommer)
data1a <- read.table("targetA.sommer",sep="\t",header=TRUE,row.names=1)
data1d <- read.table("targetD.sommer",sep="\t",header=TRUE,row.names=1)
data11a <- as.matrix(data1a)
data11d <- as.matrix(data1d)
A1 <- A.mat(data11a)
D1 <- D.mat(data11d)
data2a <- read.table("untargetA.sommer",sep="\t",header=TRUE,row.names=1)
data2d <- read.table("untargetD.sommer",sep="\t",header=TRUE,row.names=1)
data22a <- as.matrix(data2a)
data22d <- as.matrix(data2d)
A2 <- A.mat(data22a)
D2 <- D.mat(data22d)
pheno <- read.table(args[1],sep="\t",header = TRUE)
mix1 <- mmer(Pheno~1,random=~vsr(IDta,Gu=A1)+vsr(IDtd,Gu=D1)+vsr(IDua,Gu=A2)+vsr(IDud,Gu=D2),rcov=~units,data=pheno)
summary(mix1)$varcomp
(summary(mix1)$varcomp[[1]][[1]]+summary(mix1)$varcomp[[1]][[2]])/(summary(mix1)$varcomp[[1]][[1]]+summary(mix1)$varcomp[[1]][[2]]+summary(mix1)$varcomp[[1]][[3]]+summary(mix1)$varcomp[[1]][[4]]+summary(mix1)$varcomp[[1]][[5]])*100
