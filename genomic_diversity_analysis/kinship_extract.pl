use strict;
open INPUT2,"<",$ARGV[0] or die "Can't open INPUT2:$!\n";
my $mm;
my @array1;
while(<INPUT2>){
  chomp;
  $mm++;
  $array1[$mm]=$_;
}
close INPUT2;

open INPUT1,"<",$ARGV[1] or die "Can't open INPUT1:$!\n";
my $ll;
my $nn;
my @array2;
while(<INPUT1>){
  chomp;
  $ll++;
  @array2=split/\t/,$_;
  if($ll>=2){
    $nn++;
    my $temp=$ll-1;
    for(1..$temp){
      my $temp2=$_-1;
      print $array1[$ll]."\t".$array1[$_]."\t".$array2[$temp2]."\n";
    }
  }
}
close INPUT1;

        
