## multiple comparison
Rscript multiple_comparison.R $1
#### $1 phenotype, format: ID\tGroup\tPheno
#### test file: ./Y1_to_Y3_LL.txt


## two.sided t.test
t.test(y~x,data,alternative="two.sided")

## two.sided wilcox test
wilcox.test(y~x,data,alternative = "two.sided")

## one-sided wilcox test
wilcox.test(y~x,alternative = "less") 

## hybrids from 3 breeding periods
./Y1.list
./Y2.list
./Y3.list