##calculating the d/a index based on the genotypic effect estimated by EMMAX
sh d_to_a_ratio.sh $1 $2 $3

####$1 1 or 2; 1 indicated_traits_with_high_observation_preferred_by_breeding_practice; 2 indicated_traits_with_low_observation_preferred_by_breeding_practice 
####$2 parameter:Marker  eg. 1_1203 (corresponding to the column#2 of the  *_effects.txt file)
####$3 file:*_effects.txt (produced by EMMAX)
