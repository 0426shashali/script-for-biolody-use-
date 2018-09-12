#seperate data
setwd("/Users/lishasha/Desktop/home/project/2016/circRNA/classifier")
a<-read.table("selected_data_rm.txt",head=T)
dim(a)
x <- as.matrix(a[, 2:11])
y <- a[, 1]
set.seed(1)
train <- sample(1:nrow(x), nrow(x) * 2/3)
test <- (-train)

#1 train model
library(randomForest)
set.seed(71)
model <- randomForest(x = x[train, ], y = y[train], importance=TRUE,
                        proximity=TRUE)
print(model)

plot(model)

# Variable Importance Plot
varImpPlot(model,
           sort = T,
           main="Variable Importance",
           n.var=10)
# print(importance(model,type = 1)) #与varImpPlot左侧对应
# print(importance(model,type = 2)) #与varImpPlot右侧对应


#var.imp <- data.frame(importance(model,type = 1))
#var.imp[order(var.imp$MeanDecreaseGini,decreasing = T),]


#2 Predicting test data
predict_test <- predict(model ,x[test, ])

table(observed = y[test], predicted = predict_test)
library(e1071)
library(caret)
confusionMatrix(data= predict_test, reference=y[test])

#3 predict response for the validation sample and calculate model accuracy for the sample

cohort2<-read.table("plasm_cohort2_rm.txt",head=T)
dim(cohort2)

predict_corhort2 <- predict(model,cohort2[,-1])
confusionMatrix(data = predict_corhort2, reference = cohort2[,1])

