a=glmnet(x,pree[,1],family="binomial")plot(a)
model <- cv.glmnet(x,pree[,1],family="binomial")