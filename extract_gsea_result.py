import os,glob
g=open('/Users/lishasha/Desktop/home/new_work/20150801_3000drugs/gsea/plan1/again/new/fc/tmp/result5.fa','w')
input = glob.glob( '/Users/lishasha/Desktop/home/new_work/20150801_3000drugs/gsea/plan1/again/new/fc/tmp/column*/gsea_report_for_na*.xls' )
for d in input:
    name = d.split('.')[0].split('/')[-1]
    f=open(d,'r')
    g.write(name+'\n')
    for each in f:
        g.write(each)
    print name + ' finished'

