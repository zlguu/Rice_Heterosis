use strict;
open INPUT1,"<",$ARGV[0] or die "Can't open INPUT1:$!\n";
my @array1;
my $ll;
open OUT1,">>",$ARGV[1] or die "Can't open OUT:$!\n";
while(<INPUT1>){
  chomp;
  @array1=split/\t/,$_;
  $ll++;
  if($ll==1){
    print OUT1 $array1[0]."x".$array1[1];
  }else{
    if($array1[0] eq "00" && $array1[1] eq "00"){
      print OUT1 "\t00";
    }elsif($array1[0] eq "00" && $array1[1] eq "11"){
      print OUT1 "\t01";
    }elsif($array1[0] eq "11" && $array1[1] eq "00"){
      print OUT1 "\t01";
    }elsif($array1[0] eq "11" && $array1[1] eq "11"){
      print OUT1 "\t11";
    }else{
      print OUT1 "\tNA";
    }
  }
}
print OUT1 "\n";
close INPUT1;
close OUT1;
