use strict;
##$ARGV[0]=vcf file without header, the first line was "#CHROM"
##$ARGV[1]=GWAS top100 loci eg. "chr03 1270943 2.07e-20 102.769 113.743 1"
##$ARGV[2]=file produced by perl script "/data5/home/zlgu/perl_script/random/vcf_transform_1.pl"  and  then zhuanzhi
open INPUT1,"<",$ARGV[0] or die "Can't open INPUT1:$!\n";
my $n=0;
my @array1;
my %hash1;
while(<INPUT1>){
  chomp;
  if($_!~/#/){
    $n++;
    @array1=split/\t/,$_;
    my $temp1=$array1[0]." ".$array1[1];
    $hash1{$n}=$temp1;
  }
}
open INPUT2,"<",$ARGV[1] or die "Can't open INPUT2:$!\n";
my %hash2;
while(<INPUT2>){
  chomp;
  @array1=split/\t/,$_;
  my $temp1=$array1[0]." ".$array1[1];
  $hash2{$temp1}=$array1[4];
}
close INPUT2;
open INPUT3,"<",$ARGV[2] or die "Can't open INPUT3:$!\n";
my $m=0;
my %hash3;
my $count;
while(<INPUT3>){
  chomp;
  $m++;
  if($m>=1){
    @array1=split/\t/,$_;
    for(1..($#array1-1)){
      my $temp1=$hash2{$hash1{$_}};
      my $temp2=$temp1.$temp1;
      if($array1[$_] eq $temp2){
        $hash3{$array1[0]}+=2;
      }elsif($array1[$_] eq "01"){
        $hash3{$array1[0]}+=1;
      }
    }
    print $array1[0]."\t".$hash3{$array1[0]}."\n";
  }
}
close INPUT3;
