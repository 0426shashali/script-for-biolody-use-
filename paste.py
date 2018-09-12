import os,glob
input = glob.glob( '/Users/lishasha/Desktop/home/new_work/20150801_3000drugs/gsea/plan1/again/new/fc/split/*' )
for d in input:
    name = d.split('/')[-1].split('.')[0]
    print('paste /Users/lishasha/Desktop/home/new_work/20150801_3000drugs/gsea/plan1/again/new/fc/name.txt {f} > /Users/lishasha/Desktop/home/new_work/20150801_3000drugs/gsea/plan1/again/new/fc/paste/{b}.rnk'.format( f = d,b = name ))
    os.system('paste /Users/lishasha/Desktop/home/new_work/20150801_3000drugs/gsea/plan1/again/new/fc/name.txt {f} > /Users/lishasha/Desktop/home/new_work/20150801_3000drugs/gsea/plan1/again/new/fc/paste/{b}.rnk'.format( f = d,b = name ))
    print name + ' finished'
