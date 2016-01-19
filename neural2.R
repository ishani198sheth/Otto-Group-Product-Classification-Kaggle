rm(list=ls())

train <- read.csv("E:/INF-550 Data Informatics/Otto/train3.csv")
validation <- read.csv("E:/INF-550 Data Informatics/Otto/val.csv")

train2 <- train[,-1]

library(nnet)
library(ROCR)
fit <- nnet(target~ ., data=train2, size=9, maxit=10000, decay=.001)
# table(validation$target,predict(fit,newdata=validation,type="class"),validation$target)

 pred = prediction(predict(fit,newdata=validation,type="prob"),validation$target)
 perf = performance(pred,"tpr","fpr")
 plot(perf,lwd=2,col="blue",main="ROC - Neural Network on Adult")
abline(a=0,b=1)
