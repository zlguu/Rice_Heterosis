use strict;
open INPUT1,"<",$ARGV[0] or die "Can't open INPUT1:$!\n";
my @array1;
my @array2;
my @array3;
my $n;
while(<INPUT1>){
  chomp;
  if($_!~/#/){
    @array1=split/\t/,$_;
    @array2=split/\,/,$array1[4];
    @array3=split/\|/,$array1[7];
    print $array1[0]."\t".$array1[1];
    for(0..$#array2){
      if($array2[$_] ne '*'){
        $n++;
      }
    }
    $array3[0]=~s/.*ANN=//g;
    print "\t".$array3[0];
    print "\t".$array3[1];
    if($n>=2){
      for(1..$n-1){
        my $a=$_*15;
        $array3[$a]=~s/.*,//g;
        print "\t".$array3[$a];
        print "\t".$array3[$a+1];
      }
    }
    print "\n";
  }
  $n=0;
}
close INPUT1;
