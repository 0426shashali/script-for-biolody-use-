import sys

rnk_filename = sys.argv[1]

f=open(rnk_filename,'r')
g=open(rnk_filename+'_with_0_removed.rnk','w')

for each in f:
    a=each.strip('\n').split('\t')
    if a[1]!='0':
        g.write(each)

f.close()
g.close()
