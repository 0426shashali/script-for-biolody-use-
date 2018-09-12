import os,glob
input = glob.glob( '/home/lss/project/compound_new/mapping/*.sam' )
for d in input:
    print('python /home/lss/project/compound_new/mapping/split_colume3.py {s}'.format( s = d))
    os.system('python /home/lss/project/compound_new/mapping/split_colume3.py {s}'.format( s = d))
    print d + ' finished'

