import os,glob
g=open('/Users/lishasha/Desktop/home/new_work/20150904_7000compound/capital_bio/probe_test/diff_expression_gene/gsea/gsea_test/gsea_result_70own_pathway.fa','w')
input = glob.glob( '/Users/lishasha/Desktop/home/new_work/20150904_7000compound/capital_bio/probe_test/diff_expression_gene/gsea/gsea_output3/column*/gsea_report_for_na*.xls' )
for d in input:
    name = d.split('/')[-2].split('.')[0]
    f=open(d,'r')
    for each in f:
        g.write(name+'\t'+each)
    print name + ' finished'

