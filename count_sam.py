import os,glob
input = glob.glob( '/Share/home/wangdong/lss/project/compand_60/mapping/*.sam' )
for d in input:
    print('python /Share/home/wangdong/lss/project/20150430_sw_probes_screen/mapping/split_colume3.py {s}'.format( s = d))
    os.system('python /Share/home/wangdong/lss/project/20150430_sw_probes_screen/mapping/split_colume3.py {s}'.format( s = d))
    print d + ' finished'

