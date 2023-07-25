##$1 1 or 2; 1 indicated_traits_with_high_observation_preferred_by_breeding_practice; 2 indicated_traits_with_low_observation_preferred_by_breeding_practice 
##$2 parameter:Marker  eg. 1_1203
##$3 file:*_effects.txt (produced by EMMAX)

awk -v value=$2 '{if($2==value)printf $6" "}' $3 >a

if [ $1 == 1 ];then
  awk -v value=$2 '{if($1>$2){a=($1-$2)/2;d=($3-($1+$2)/2);print value,d/a}else{a=($2-$1)/2;d=($3-($1+$2)/2);print value,d/a}}' a 
fi
if [ $1 == 2 ];then
  awk -v value=$2 '{if($1>$2){a=($1-$2)/2;d=($3-($1+$2)/2);print value,-d/a}else{a=($2-$1)/2;d=($3-($1+$2)/2);print value,-d/a}}' a
fi    
    