import os,glob
input = glob.glob( '/Share/home/wangdong/lss/project/compand_60/Project_QH/*' )
for d in input:
    name = d.split('_')[3]
    print('cat {f}/*.fastq >> {b}.fastq'.format( f = d,b = name ))
    os.system('cat {f}/*.fastq >> {b}.fastq'.format( f = d,b = name ))
    print name + ' finished'

