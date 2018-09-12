import os,glob
g=open('/Users/lishasha/Desktop/home/new_work/20150904_7000compound/capital_bio/probe_test/diff_expression_gene/gsea/gsea_test/result5.fa','w')
input = glob.glob( '/Users/lishasha/Desktop/home/new_work/20150904_7000compound/capital_bio/probe_test/diff_expression_gene/gsea/gsea_output2/column*/gsea_report_for_na*.xls' )
for d in input:
    name = d.split('/')[-2].split('.')[0]
    f=open(d,'r')
    g.write(name+'\n')
    for each in f:
        each1=each.strip('\n').split('    ')
        m=each1[4].strip('  ')
        if float(m)<0.01:
            g.write(each)
    print name + ' finished'

