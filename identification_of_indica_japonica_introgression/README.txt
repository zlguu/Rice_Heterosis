##identification of the japonica introgession across the whole genome of indica-indica hybrids
sh 0_identification_indica_japonica_introgression.sh $1 $2
##$1 file:*.vcf
##$2 the_column_number_of_target_sample_in_vcf_file  eg. 23 


## the 830,245 indica-japonica differentiated SNPs
./indica_japonica_differentiated.snp

## processing scripts
./xiangengbin.py
#### scanning for the introgreesion segements based on the marker state


## format of output
chromosome\tbin_start\tbin_end\tstate
## state1 : ind (indica-indica)
## state2 : jap (japonica-japonica)
## state3 : hetero (indica-japonica)