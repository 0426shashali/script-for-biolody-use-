import sys,os
inputfile=sys.argv[1]
genelist=open(inputfile,'r')
for each in genelist:
    each1=each.strip().split('\t')
    sample=each1[0]
    name=each1[1]
    print('grep -A 3 \':N:0:{s}\' /Share/home/wangdong/data/rawdata/150315_C00126_0172_AHFNJ5ADXX/Unaligned2/Undetermined_indices/R.fastq | awk \'$1 != "--"\' >> /Share/home/wangdong/data/rawdata/150315_C00126_0172_AHFNJ5ADXX/Unaligned2/Undetermined_indices/tmp/{n}.fastq'.format(s=sample,n=name))
    os.system('grep -A 3 \':N:0:{s}\' /Share/home/wangdong/data/rawdata/150315_C00126_0172_AHFNJ5ADXX/Unaligned2/Undetermined_indices/R.fastq | awk \'$1 != "--"\' >> /Share/home/wangdong/data/rawdata/150315_C00126_0172_AHFNJ5ADXX/Unaligned2/Undetermined_indices/tmp/{n}.fastq'.format(s=sample,n=name))
    print name + 'finished'

genelist.close()
