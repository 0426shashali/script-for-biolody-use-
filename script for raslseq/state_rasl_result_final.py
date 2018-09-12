#this script can put all rasl result *sam_3_result.fa  into one excel file


import os,glob
outfile=open('/Share/home/wangdong/lss/project/compand_60/count/final_result_table3.fa','w')
input = glob.glob( '/Share/home/wangdong/lss/project/compand_60/mapping/*sam_3_result.fa' )
genelist=open('/Share/home/wangdong/lss/project/compand_60/count/gene_list.fa','r')
d={}
length=len(input)
for g in genelist:
    g=g.strip('\n')
    d[g]=[0]*length  
n = 0       
head='gene_name'
for fa in input:
    name=fa.split('.')[0].split('/')[-1]
    head=head+'\t'+name
    f=open(fa,'r')
    for l in f:
        f1=l.strip('\n').split('\t')
        g1=f1[0]
        if g1 in d:
            d[g1][n]=f1[1]  
    n = n + 1
    f.close()
outfile.write(head+'\n')
for k in d:
    outfile.write(k+'\t'+str(d[k])+'\n')
outfile.close()
    