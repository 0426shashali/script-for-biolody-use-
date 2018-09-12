import os,glob
input = glob.glob( '/Users/lishasha/Desktop/home/new_work/20150801_3000drugs/gsea/plan1/again/new/fc/paste/*' )
for d in input:
    name = d.split('/')[-1].split('.')[0]
    print('java -cp /Users/lishasha/Desktop/home/tools/gsea2-2.2.0.jar -Xmx512m xtools.gsea.GseaPreranked -gmx /Users/lishasha/Desktop/home/new_work/20150801_3000drugs/gsea/plan1/again/new/fc/run_gsea/CTNNB1_UP.gmt -collapse false -mode Max_probe -norm meandiv -nperm 1000 -rnk {f} -scoring_scheme classic -rpt_label {b} -include_only_symbols true -make_sets true -plot_top_x 20 -rnd_seed timestamp -set_max 500 -set_min 0 -zip_report false -out /Users/lishasha/gsea_home/output/gsea -gui false'.format( f = d,b = name ))
    os.system('java -cp /Users/lishasha/Desktop/home/tools/gsea2-2.2.0.jar -Xmx512m xtools.gsea.GseaPreranked -gmx /Users/lishasha/Desktop/home/new_work/20150801_3000drugs/gsea/plan1/again/new/fc/run_gsea/CTNNB1_UP.gmt -collapse false -mode Max_probe -norm meandiv -nperm 1000 -rnk {f} -scoring_scheme classic -rpt_label {b} -include_only_symbols true -make_sets true -plot_top_x 20 -rnd_seed timestamp -set_max 500 -set_min 0 -zip_report false -out /Users/lishasha/gsea_home/output/gsea -gui false'.format( f = d,b = name ))
    print name + ' finished'

