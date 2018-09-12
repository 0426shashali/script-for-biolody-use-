import os,glob
input = glob.glob( '/Share/home/wangdong/data/rawdata/150902_D00489_0087_AC66U2ANXX/unligned2/Undetermined_indices/Sample_lane*' )
for d in input:
    name = d.split('/')[-1]
    print('gzip -d {f}/*.gz | cat {f}/*.fastq >> /Share/home/wangdong/data/rawdata/150902_D00489_0087_AC66U2ANXX/unligned2/fastq/{b}.fastq'.format( f = d,b = name ))
    os.system('gzip -d {f}/*.gz | cat {f}/*.fastq >> /Share/home/wangdong/data/rawdata/150902_D00489_0087_AC66U2ANXX/unligned2/fastq/{b}.fastq'.format( f = d,b = name ))
    print name + ' finished'

