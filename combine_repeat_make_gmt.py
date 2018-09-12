f=open('overlap.fa','r')
g=open('overlap_uniq.fa','w')

dic={}

for line in f.readlines():
    name,rpkm1=line.strip('\n').split('\t')
    if name in dic.keys():
        dic.setdefault(name,[]).append(rpkm1)
    else:
        dic.update({name:[rpkm1]})
for key,val in dic.items():
    g.write(str(key)+'\t'+str(val)+'\n')

f.close()