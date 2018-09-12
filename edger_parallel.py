# run edger in parallel
import sys,glob,os
input = glob.glob( '/Users/lishasha/Desktop/home/project/2016/20160608_capitalbio_new_old_rasl_method/plates/lane1_plate1_*_targets.txt' )
for f in input:
    f1=f.split('_targets')[0]
    output1 = f1+'_BCV'+'.pdf'
    output2 = f1+'_deg.txt'
    output3 = f1+'_deg_05.txt'
    output4 = f1+'_deg_05fold2.txt'
    output5 = f1+'_smear'+'.pdf'
    os.system( 'Rscript edger_parallel.r {i} {o1} {o2} {o3} {o4} {o5}'.format( i=f,o1=output1,o2=output2,o3=output3,o4=output4,o5=output5 ) )
    print f + ' finished'
