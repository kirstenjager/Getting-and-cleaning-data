## Create a directory
if(!file.exists("./data")){dir.create("./data")}
library(dplyr)

## Download data and unzip data
## install.packages("downloader")
library(downloader)
download("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
         dest = "dataset.zip", mode = "wb")
files <- unzip("dataset.zip", exdir = ".")

## Read training data
features <- read.table("./UCI HAR Dataset/features.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features[,2])
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt", col.names = "activityId")
Subj_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subjectId")

## Merge all training data
trainingdata <- cbind(Y_train, Subj_train, X_train)

## Read test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features[,2])
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt", col.names = "activityId")
Subj_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subjectId")

## Merge all test data
testdata <- cbind(Y_test, Subj_test, X_test)

## 1. Merges the training and the test sets to create one data set.
dataset <- rbind(trainingdata, testdata)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
columnsToKeep <- grepl("subjectId|activityId|mean|std", colnames(dataset))
dataset_new <- dataset[, columnsToKeep]

##3. Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE, col.names = c("activityId","activityType"))

dataset_new <- merge(dataset_new, activityLabels, by = "activityId")


##4. Appropriately labels the data set with descriptive variable names. 
for (i in 1:length(colnames(dataset_new)))
{
  colnames(dataset_new)[i] <- gsub("-std$", "StdDev", colnames(dataset_new)[i])
  colnames(dataset_new)[i] <- gsub("-mean", "Mean", colnames(dataset_new)[i])
}

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
## for each activity and each subject.

tidy_dataset <-group_by(dataset_new,subjectId,activityType)%>%summarise_all(.funs = mean)

## Export tidy dataset
write.table(tidy_dataset, './TidyDataset.csv',row.names=FALSE,sep='\t')
