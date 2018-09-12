# -*- coding: cp936 -*-
import sys

sam_filename = sys.argv[1]

#功能:提取出sam文件中第三列
f=open(sam_filename,'r')
g=open(sam_filename+'_3_2.fa','w')

for each in f:
    if each[0]!='@':
        line=each.split('\t')
        n=line[2]
        g.write(n+'\t'+'1'+'\n')

f.close()
g.close()

#功能:计数第三列
f=open(sam_filename+'_3_2.fa','r')
g=open(sam_filename+'_3_result_1.fa','w')

dic={}

for line in f.readlines():
    name,rpkm1=line.split()
    if name in dic.keys():
        dic[name] +=float(rpkm1)
    else:
        dic.update({name:float(rpkm1)})
for key,val in dic.items():
    g.write(str(key)+'\t'+str(val)+'\n')

f.close()
g.close()
