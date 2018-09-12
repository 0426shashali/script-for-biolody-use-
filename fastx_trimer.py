import os,glob
input = glob.glob( '/data/150728_C00126_0206_AC5409ACXX/Unaligned/Undetermined_indices/merged_lane7_lane8/*.fastq' )
for d in input:
    name = d.split('/Lane')[-1]
    name1=name.split('.')[0]
    print('fastx_trimmer -f 1 -l 51 -Q 33 -i {fastq} -o /home/lss/project/compound_new/fastq_51/Lane{b}.fastq'.format( fastq = d,b = name1 ))
    os.system('fastx_trimmer -f 1 -l 51 -Q 33 -i {fastq} -o /home/lss/project/compound_new/fastq_51/Lane{b}.fastq'.format( fastq = d,b = name1 ))
    print name + ' finished'

