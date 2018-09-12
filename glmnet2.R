library(glmnet)
prostate <- read.csv("E:/RB/prostate.csv")
head(prostate)
## lcavol age lbph lcp gleason lpsa
## 1 -0.5798 50 -1.386 -1.386 6 -0.4308
## 2 -0.9943 58 -1.386 -1.386 6 -0.1625
## 3 -0.5108 74 -1.386 -1.386 7 -0.1625
## 4 -1.2040 58 -1.386 -1.386 6 -0.1625
## 5 0.7514 62 -1.386 -1.386 6 0.3716
## 6 -1.0498 50 -1.386 -1.386 6 0.7655

x <- as.matrix(prostate[, 2:6])
y <- prostate[, 1]
set.seed(1)
train <- sample(1:nrow(x), nrow(x) * 2/3)
test <- (-train)
r1 <- glmnet(x = x[train, ], y = y[train], family = "gaussian", alpha = 0)
plot(r1, xvar = "lambda")
r1.cv <- cv.glmnet(x = x, y = y, family = "gaussian", alpha = 0, nfold = 10)
plot(r1.cv)
mte <- predict(r1, x[test, ])
mte <- apply((mte - y[test])^2, 2, mean)
points(log(r1$lambda), mte, col = "blue", pch = 19)
legend("topleft", legend = c("10 - fold CV", "Test"), col = c("red", "blue"))
r1.min <- glmnet(x = x, y = y, family = "gaussian", alpha = 0, lambda = r1.cv$lambda.min)
coef(r1.min)
## 6 x 1 sparse Matrix of class "dgCMatrix"
## s0
## (Intercept) -1.49547
## age 0.01736
## lbph -0.07641
## lcp 0.28666
## gleason 0.08176
## lpsa 0.50190
# lasso
r2 <- glmnet(x = x[train, ], y = y[train], family = "gaussian", alpha = 1)
plot(r2, xvar = "lambda")r2.cv <- cv.glmnet(x = x, y = y, family = "gaussian", alpha = 1, nfold = 10)
plot(r2.cv)
mte <- predict(r2, x[test, ])
mte <- apply((mte - y[test])^2, 2, mean)
points(log(r2$lambda), mte, col = "blue", pch = 19)
legend("topleft", legend = c("10 - fold CV", "Test"), col = c("red", "blue"))
# cv.min vs cv.1se,用全部数据再次拟合模型
r2.cv$lambda.min
## [1] 0.002954
r2.cv$lambda.1se
## [1] 0.1771

r2.1se <- glmnet(x = x, y = y, family = "gaussian", alpha = 1, lambda = r2.cv$lambda.1se)
coef(r2.1se)
## 6 x 1 sparse Matrix of class "dgCMatrix"
## s0
## (Intercept) 0.3234
## age . 
## lbph . 
## lcp 0.2462
## gleason . 
## lpsa 0.4320
r2.min <- glmnet(x = x, y = y, family = "gaussian", alpha = 1, lambda = r2.cv$lambda.min)
coef(r2.min)
## 6 x 1 sparse Matrix of class "dgCMatrix"
## s0
## (Intercept) -1.44505
## age 0.01851
## lbph -0.08585
## lcp 0.29688
## gleason 0.05081
## lpsa 0.53741
