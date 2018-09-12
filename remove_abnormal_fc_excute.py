import os,glob
input = glob.glob( '/Users/lishasha/Desktop/home/new_work/20150904_7000compound/capital_bio/probe_test/diff_expression_gene/gsea/paste/*.rnk' )
for d in input:
    print('python /Users/lishasha/Desktop/home/script/rasl_pipeline/remove_abnormal_fc.py {s}'.format( s = d))
    os.system('python /Users/lishasha/Desktop/home/script/rasl_pipeline/remove_abnormal_fc.py {s}'.format( s = d))
    print d + ' finished'
