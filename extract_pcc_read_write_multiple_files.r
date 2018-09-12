＃过滤整个矩阵，批量输入输出
m<-list.files("/Users/lishasha/Desktop/home/new_work/20151122_compound_comfirmation/total_plot_indensity/test")
for (i in 1:length(m)){
    a<-read.table(m[i],head=T,sep="\t")
    a<-replace(a,abs(a)<80,0)
    keep = rowSums(a)!=0
    write.table(a,paste("/Users/lishasha/Desktop/home/new_work/20151122_compound_comfirmation/total_plot_indensity/test/",i,".txt"))
}