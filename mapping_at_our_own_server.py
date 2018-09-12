import os,glob
input = glob.glob( '/home/lss/project/compound_new/fastq_51/*.fastq' )
for d in input:
    name = d.split('/Lane')[-1]
    name1=name.split('.')[0]
    print('bowtie -n 3 /home/lss/project/compound_new/ref1273_rasl_final {fastq} -S /home/lss/project/compound_new/mapping/Lane{b}.sam'.format( fastq = d,b = name1 ))
    os.system('bowtie -n 3 /home/lss/project/compound_new/ref1273_rasl_final {fastq} -S /home/lss/project/compound_new/mapping/Lane{b}.sam'.format( fastq = d,b = name1 ))
    print name + ' finished'

