import os,glob
input = glob.glob( '/Share/home/wangdong/lss/project/20150801_3000drug/paste/*' )
for d in input:
    name = d.split('/')[-1].split('.')[0]
    print('java -cp /Share/home/wangdong/local/app/gsea/gsea2-2.2.0.jar -Xmx512m xtools.gsea.GseaPreranked -gmx /Share/home/wangdong/lss/project/20150801_3000drug/CTNNB1_DOWN.gmt -collapse false -mode Max_probe -norm meandiv -nperm 1000 -rnk {f} -scoring_scheme classic -rpt_label {b} -include_only_symbols true -make_sets true -plot_top_x 20 -rnd_seed timestamp -set_max 500 -set_min 0 -zip_report false -out /Share/home/wangdong/lss/project/20150801_3000drug/gsea_output -gui false'.format( f = d,b = name ))
    os.system('java -cp /Share/home/wangdong/local/app/gsea/gsea2-2.2.0.jar -Xmx512m xtools.gsea.GseaPreranked -gmx /Share/home/wangdong/lss/project/20150801_3000drug/CTNNB1_DOWN.gmt -collapse false -mode Max_probe -norm meandiv -nperm 1000 -rnk {f} -scoring_scheme classic -rpt_label {b} -include_only_symbols true -make_sets true -plot_top_x 20 -rnd_seed timestamp -set_max 500 -set_min 0 -zip_report false -out /Share/home/wangdong/lss/project/20150801_3000drug/gsea_output -gui false'.format( f = d,b = name ))
    print name + ' finished'

