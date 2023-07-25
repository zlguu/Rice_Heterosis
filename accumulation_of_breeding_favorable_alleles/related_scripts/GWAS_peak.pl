use strict;
open INPUT1,"<",$ARGV[0] or die "Can't open INPUT1:$!\n";
my @array1;
my $lastchrom;
my $lastcoor;
my $lastp;
my $nn=1;
my $start;
my $end;
my $peak;
my $peakcoor;
while(<INPUT1>){
  chomp;
  @array1=split/\t/,$_;
  $start=($nn-1)*500000+1;
  $end=$nn*500000;
  if($lastchrom){
    if($array1[1] eq $lastchrom){
      if(($array1[2]>=$start)&&($array1[2]<=$end)){
        if($peak>$array1[3]){
          $peak=$array1[3];
          $peakcoor=$array1[2];
        }
      }elsif($array1[2]>$end){
        $nn++;
        print $array1[1]."\t".$start."\t".$end."\t".$peakcoor."\t".$peak."\n";
        $peak=$array1[3];
        $peakcoor=$array1[2];
      }
    }else{
      $nn=1;
      print $lastchrom."\t".$start."\t".$end."\t".$peakcoor."\t".$peak."\n";
      $peak=$array1[3];
      $peakcoor=$array1[2];
    }
  }else{
    $peak=$array1[3];
    $peakcoor=$array1[2];
  }
  $lastchrom=$array1[1];
  $lastcoor=$array1[2];
  $lastp=$array1[3];
}
close INPUT1;
