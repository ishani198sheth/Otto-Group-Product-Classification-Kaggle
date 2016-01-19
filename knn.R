
rm(list=ls())

train <- read.csv("E:/INF-550 Data Informatics/Otto/train.csv")
test <- read.csv("E:/INF-550 Data Informatics/Otto/test.csv")
sample_sub <- read.csv("E:/INF-550 Data Informatics/Otto/sampleSubmission.csv")

train2 <- train[,-1]

library(class)
knn(train, test, cl, k = 3, prob=TRUE)
pred <- attributes(.Last.value)

submit <- data.frame(id = test$id, pred)
write.csv(submit, file = "E:/INF-550 Data Informatics/Otto/knn.csv", row.names = FALSE)
