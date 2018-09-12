# prepare EDGER targets in parallel
import sys,glob,os
input1 = glob.glob( '/Users/lishasha/Desktop/home/project/2016/20160608_capitalbio_new_old_rasl_method/EDGER/lane1_plate1_*.txt' )
for f in input1:
    description=f.split('.')[0].split('/')[-1]
    m=str(f)+'\t'+'TREAT'+'\t'+description
    output1=description+'_targets.txt'
    os.system( 'Rscript prepare_edger_targets_in_parallel.r {i} {o1}'.format( i=m,o1=output1) )
    print f + ' finished'
