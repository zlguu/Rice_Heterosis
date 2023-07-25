use strict;
open INPUT1,"<",$ARGV[0] or die "Can't open INPUT1:$!\n";
my @array1;
my @array2;
my @array3;
my $n;
my @array4;
while(<INPUT1>){
	chomp;
	if($_!~/#/){
		$n++;
		@array1=split/\t/,$_;
		@array2=split/\,/,$array1[4];
                $array4[0][$n]=$array1[2];
		if($#array2==0){
			for(9..$#array1){
				@array3=split//,$array1[$_];
				my $geno=$array3[0].$array3[2];
				if($_>=9){
 				  if($geno eq "00"){
					  $array4[$_-8][$n]=0;
				  }elsif($geno eq "01"){
					  $array4[$_-8][$n]=1;
				  }elsif($geno eq "11"){
					  $array4[$_-8][$n]=0;
			    }else{
			  	  $array4[$_-8][$n]="NA";
			    }
			  }
			}
		}
	}elsif($_=~/#CHROM/){
          @array1=split/\t/,$_;
          for(9..$#array1){
            $array4[$_-8][0]=$array1[$_];
          }
        }

}
close INPUT1;
$array4[0][0]="";
my $variety=$#array1-8;
my $a;
#print $variety."\t$n\n";
for(0..$variety){
	$a=$_;
	print $array4[$a][0];
	for(1..$n){
		print "\t".$array4[$a][$_];
	}
	print "\n";
}
