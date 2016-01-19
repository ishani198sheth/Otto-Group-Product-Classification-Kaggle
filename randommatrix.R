
rm(list=ls())

train <- read.csv("E:/INF-550 Data Informatics/Otto/train3.csv")
validation <- read.csv("E:/INF-550 Data Informatics/Otto/val.csv")

train2 <- train[,-1]



library(randomForest)

set.seed(6000)

fit <- randomForest(as.factor(target) ~ ., data=train2, importance=TRUE, ntree=500)

table(validation$target,predict(fit,newdata=validation,type="class"),validation$target)

