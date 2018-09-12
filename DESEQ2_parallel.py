# run DESEQ in parallel
import sys,glob,os
input = glob.glob( '/Users/lishasha/Desktop/home/project/2016/why/epi_Deseq/DESEQ_parallel/si_*.txt' )
for f in input:
    f1=f.split('.')[0]
    output1 = f1+'_MAplot'+'.pdf'
    output2 = f1+'_deg.txt'
    output3 = f1+'_deg_05.txt'
    output4 = f1+'_deg_05fold2.txt'
    os.system( 'Rscript DESEQ2_parallel.r {i} {o1} {o2} {o3} {o4}'.format( i=f,o1=output1,o2=output2,o3=output3,o4=output4 ) )
    print f + ' finished'
