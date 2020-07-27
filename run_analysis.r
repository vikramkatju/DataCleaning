rm(list = ls())

#Downloading the dataset
if(!file.exists("Dataset.zip")){
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, destfile = "Dataset.zip")
  unzip(zipfile = "Dataset.zip")
}

library(dplyr)

#Setting the paths and reading the data from the files

#training data
train_path <- paste(getwd(), "/UCI HAR Dataset/train/", sep = "")
X_train <- read.table(paste(train_path, "X_train.txt", sep = ""), header = FALSE)
y_train <- read.table(paste(train_path, "y_train.txt", sep = ""), header = FALSE)
subject_train <- read.table(paste(train_path, "subject_train.txt", sep = ""), header = FALSE)

#testing data
test_path <- paste(getwd(), "/UCI HAR Dataset/test/", sep = "")
X_test <- read.table(paste(test_path, "X_test.txt", sep = ""), header = FALSE)
y_test <- read.table(paste(test_path, "y_test.txt", sep = ""), header = FALSE)
subject_test <- read.table(paste(test_path, "subject_test.txt", sep = ""), header = FALSE)

#features and activity labels
main_path <- paste(getwd(), "/UCI HAR Dataset/", sep = "")
features <- read.table(paste(main_path, "/features.txt", sep = ""), header = FALSE)
activity <- read.table(paste(main_path, "/activity_labels.txt", sep = ""), header = FALSE)

head(X_train)
str(X_train)
head(features)
str(features)

#Adjusting X_train
colnames(X_train) <- features$V2
X_train$subject <- factor(subject_train$V1)
X_train$activity <- y_train$V1

#Adjusting X_test
colnames(X_test) <- features$V2
X_test$subject <- factor(subject_test$V1)
X_test$activity <- y_test$V1

#Question 1
#Merge training and test sets to create one dataset
dat <- rbind(X_test, X_train)

#Question 2
#Extract only the measurements on the mean and standard deviation for each measurement
column.names <- colnames(dat)

column.names.filtered <- grep("std\\(\\)|mean\\(\\)|activity|subject", column.names, value=TRUE)
column.names.filtered
dat.filtered <- dat[, column.names.filtered] 
str(dat.filtered)

#Question 3
#Use descriptive activity names to name the activities in the dataset
dat.filtered$activitylabel <- 
  factor(dat.filtered$activity, 
         labels= c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

str(dat.filtered)

#Question 4
#Appropriately label the dataset with descriptive variable names
features.colnames = grep("std\\(\\)|mean\\(\\)", column.names, value=TRUE)

library(reshape2)
dat.melt <-melt(dat.filtered, id = c('activitylabel', 'subject'), measure.vars = features.colnames)
dat.tidy <- dcast(dat.melt, activitylabel + subject ~ variable, mean)

#Question 5
#Create a tidy dataset
write.table(dat.tidy, file = "tidydataset.txt", row.names = FALSE)


