##args[1] phenotype
library(agricolae)
library(PMCMRplus)
args<-commandArgs(trailingOnly=T)
data1 <- read.table("args[1]",header=T,sep="\t")
## Performs Bartlett's test of the null that the variances in each of the groups (samples) are the same.
v <- bartlett.test(data1$Pheno~data1$Group)
p_value <- v[[3]]
p_value

anv_a <- function(x,parametric=p_value){
  if(parametric>0.05){
    aa <- aov(x$Pheno~x$Group)  
    return(aa)
  }else{
    aa <- kruskal.test(x$Pheno~x$Group)
    return(aa)
  }
}
aa <- anv_a(x=data1,parametric = p_value)

pvalue <- function(x,parametric=p_value){
  if(parametric>0.05){
    temp <- summary(x)
    p_value_2 <- temp[[1]][[5]][[1]]
    return(p_value_2)
  }else{
    p_value_2 <- x[[3]]
    return(p_value_2)
  }
}

p_value_2 <- pvalue(x=aa,parametric = p_value)
p_value_2


multi_com <- function(x,level=0.05,p=p_value_2,anv1=aa,q=p_value){
  if(q>0.05){  
    if(p<level){   
      lsd <- LSD.test(anv1,"x$Group",p.adj="bonferroni")
      return(lsd$groups)
    }else{
      d <- "There is no difference among different groups about their mean"
      return(d)
    }
  }else{
    ans <- kwAllPairsNemenyiTest(Pheno~Group,data=x,dist = "Chisquare")
    summary(ans)
  }
}
multi_com(x = data1,level = 0.05,p=p_value_2,anv1 = aa,q=p_value)

