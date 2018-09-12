import os,glob
input = glob.glob( '/Share/home/wangdong/lss/project/compand_60/Project_QH/*' )
for d in input:
    name = d.split('_')[3]
    print('gzip -d {f}/*.gz | cat {f}/*.fastq >> {b}.fastq'.format( f = d,b = name ))
    os.system('gzip -d {f}/*.gz | cat {f}/*.fastq >> {b}.fastq'.format( f = d,b = name ))
    print name + ' finished'

