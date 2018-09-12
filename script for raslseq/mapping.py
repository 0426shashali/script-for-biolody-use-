import os,glob
input = glob.glob( '/Share/home/wangdong/lss/project/compand_60/fastq/*.fastq' )
for d in input:
    name = d.split('Barcode')[1]
    name1=name.split('.')[0]
    print('bowtie -n 3 /Share/home/wangdong/lss/project/20150604_probe_final_test_1411/new_ref_1411_rename {fastq} -S /Share/home/wangdong/lss/project/compand_60/mapping/barcode{b}.sam'.format( fastq = d,b = name1 ))
    os.system('bowtie -n 3 /Share/home/wangdong/lss/project/20150604_probe_final_test_1411/new_ref_1411_rename {fastq} -S /Share/home/wangdong/lss/project/compand_60/mapping/barcode{b}.sam'.format( fastq = d,b = name1 ))
    print name + ' finished'

