
rm(list=ls())

train <- read.csv("E:/INF-550 Data Informatics/Otto/train.csv")
test <- read.csv("E:/INF-550 Data Informatics/Otto/test.csv")
sample_sub <- read.csv("E:/INF-550 Data Informatics/Otto/sampleSubmission.csv")

train2 <- train[,-1]



library(kernlab)


fit <- ksvm(as.factor(target) ~ ., data=train2, kernel="vanilladot", prob.model=TRUE)



pred <- predict(fit,test,type="probabilities")
submit <- data.frame(id = test$id, pred)
write.csv(submit, file = "E:/INF-550 Data Informatics/Otto/svm.csv", row.names = FALSE)
