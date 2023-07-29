use strict;
open INPUT1,"<",$ARGV[0] or die "Can't open INPUT1:$!\n";
my @array1;
my @array2;
while(<INPUT1>){
  chomp;
  if($_=~/#CHROM/){
    print "CHROM\tPOS";
    @array1=split/\t/,$_;
    for(9..$#array1){
      print "\t".$array1[$_];
    }
    print "\n";
  }elsif($_!~/#/){
    @array1=split/\t/,$_;
    print $array1[0]."\t".$array1[1];
    for(9..$#array1){
      @array2=split/\:/,$array1[$_];
      if(($array2[0] eq "0/0")||($array2[0] eq "0|0")){
        print "\t"."00";
      }elsif(($array2[0] eq "0/1")||($array2[0] eq "0|1")){
        print "\t"."01";
      }elsif(($array2[0] eq "1/1")||($array2[0] eq "1|1")){
        print "\t"."11";
      }else{
        print "\t"."NA";
      }
    }
    print "\n";
  }
}
close INPUT1;
