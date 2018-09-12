#(1)支持向量机(SVM): 
library(kernlab) 
irismodel <- ksvm(Species ~ ., data = iris,               
                     type = "C-bsvc", kernel = "rbfdot",                     
                     kpar = list(sigma = 0.1), C = 10,                     
                     prob.model = TRUE)  
irismodel 
predict(irismodel, iris[c(3, 10, 56, 68, 107, 120), -5], type = "probabilities") 
 
#Ksvm支持自定义核函数。如 
k <- function(x, y) { (sum(x * y) + 1) * exp(0.001 * sum((x - y)^2)) } 
class(k) <- "kernel" 
data("promotergene") 
gene <- ksvm(Class ~ ., data = promotergene, kernel = k, C = 10, cross = 5)#训练 
gene 
 
#对于二分类问题，可以对结果用plot()进行可视化。例子如下 
x <- rbind(matrix(rnorm(120), , 2), matrix(rnorm(120, mean = 3), , 2)) 
y <- matrix(c(rep(1, 60), rep(-1, 60))) 
svp <- ksvm(x, y, type = "C-svc", kernel = "rbfdot", kpar = list(sigma = 2)) 
plot(svp) 
 
 
library(e1071) 
set.seed(1234) 
ind<-sample(2,nrow(iris),replace=TRUE,prob=c(0.7,0.3)) #70%为训练集 30%为测试集 
train<-iris[ind==1,] 
test<-iris[ind==2,] 
svm<-svm(train[,1:4],train[,5],type="C-classification", 
         cost=10,kernel="radial",probability=TRUE,scale=FALSE) 
pred<-predict(svm,test[,1:4],decision.values=TRUE) 
table(pred,test[,5]) 
 
library(e1071)
model <- svm(Species ~ ., data = iris,             
               method = "C-classification", kernel = "radial",               
               cost = 10, gamma = 0.1) 
summary(model) 
plot(model, iris, Petal.Width ~ 
       Petal.Length, slice = list(Sepal.Width = 3,                               
                                  Sepal.Length = 4)) 
pre=predict(model, iris,type='class')  
table(pre,iris$Species)  
 
library("klaR") 
data("B3") 
Bmod <- svmlight(PHASEN ~ ., data = B3,                   
                   svm.options = "-c 10 -t 2 -g 0.1 -v 0") 
predict(Bmod, B3[c(4, 9, 30, 60, 80, 120),               
                   -1]) 
 
#(2)支持向量回归(SVR):  
library(DMwR)  
library(nnet)  
data(algae)  
algae <- algae[-manyNAs(algae), ]  
clean.algae <- knnImputation(algae[,1:12],k=10)  
norm.data <- scale(clean.algae[,4:12]) #数据标准化  
 
library(e1071)  
model.svm <- svm(a1~., norm.data)  
preds <- predict(model.svm, norm.data)  
plot(preds~ scale(clean.algae$a1))  
 
library(rminer) 
set.seed(1234) 
svr<-fit(a1~., norm.data, model="svm")  
#利用模型进行预测  
norm.preds <- predict(svr, norm.data)  
#绘制预测值与真实值之间的散点图  
plot(norm.preds~ scale(clean.algae$a1))  
#计算相对误差  
(nmse2 <- mean((norm.preds-scale(clean.algae$a1))^2)/  
   mean((mean(scale(clean.algae$a1))- scale(clean.algae$a1))^2)) 
