# -*- coding: cp936 -*-
import sys

sam_filename = sys.argv[1]

#����:��ȡ��sam�ļ��е�����
f=open(sam_filename,'r')
g=open(sam_filename+'_3_2.fa','w')

for each in f:
    if each[0]!='@':
        line=each.split('\t')
        n=line[2]
        g.write(n+'\t'+'1'+'\n')

f.close()
g.close()

#����:����������
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
