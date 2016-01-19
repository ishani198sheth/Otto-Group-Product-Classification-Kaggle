
rm(list=ls())

train <- read.csv("E:/INF-550 Data Informatics/Otto/train.csv")
test <- read.csv("E:/INF-550 Data Informatics/Otto/test.csv")
sample_sub <- read.csv("E:/INF-550 Data Informatics/Otto/sampleSubmission.csv")

train2 <- train[,-1]



library(ipred)
library(randomForest)
set.seed(6000)

fit <- bagging(as.factor(target) ~ ., data=train2, nbagg=25)

varImpPlot(fit)
pred <- predict(fit,test,type="prob")
submit <- data.frame(id = test$id, pred)
write.csv(submit, file = "E:/INF-550 Data Informatics/Otto/submit-5.csv", row.names = FALSE)
