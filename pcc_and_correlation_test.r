#计算每一个circRNA相对于所有mRNA在20个样本里的的相关系数，并对对相关系数进行检验

a<-matrix(0,175938,30000) #生成一个175938＊30000的矩阵，方便写入r
p<-a
cir<-read.table("cir.txt",head=T,row.names=1,sep="\t")
mrna<-read.table("mrna.txt",head=T,row.names=1,sep="\t")
for (i in 1:175938){
 for (j in 1:30000){
   a[i,j]<-cor(as.numeric(cir[i,]),as.numeric(mrna[j,])) #求相关系数
   p[i,j]<-as.numeric(cor.test(as.numeric(cir[i,]),as.numeric(mrna[j,]),alternative="two.side")) #对相关系数进行检验，对r不等于0的都可以进行检验
 }
}
write.table(a,"correlation.txt")
write.table(p,"pvalue.txt")