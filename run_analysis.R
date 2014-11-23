## This is for class Getting and Cleaning Data
## Class Project

## Create the download directory
setwd("C:\\Users\\lenovo\\Documents\\classes\\GettingAndCleaningData")
if(!file.exists("data")) {
        dir.create("data")
}

## Download the file
.exdir <- "./data"
.file <- file.path(.exdir, "Dataset.zip")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = .file)

## Unzip the file
unzip(.file, exdir = .exdir)

## Read in the data
XtrainData <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
ytrainData <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subjecttrainData <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

XtestData <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
ytestData <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subjecttestData <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

featuresData <- read.table("./data/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

## Combine the data into one table
## Add the subjects to the test data
subAndtestData <- cbind(XtestData, subjecttestData)
## Add the activities to the test data
AllTestData <- cbind(subAndtestData, ytestData)
## Add the subjects to the train data
subAndtrainData <- cbind(XtrainData, subjecttrainData)
## Add the activities to the train data
AllTrainData <- cbind(subAndtrainData, ytrainData)
## Combine the test and train data
TestAndTrainData <- rbind(AllTestData, AllTrainData)

## Append Subject and Activity as column names to the features dataset
tmpfeatures <- rbind(featuresData, c(562, "Subject"))
features <- rbind(tmpfeatures, c(563, "Activity"))

## Add the column names to the dataset
colnames(TestAndTrainData) <- make.names(features$V2, unique = TRUE)

## Replace the activity numbers with descriptive names
.labels <- activityLabels$V2
TestAndTrainData$Activity <- factor(TestAndTrainData$Activity, labels = .labels)

## Identify which columns have std or mean in the column name
keepcols <- grep("std\\(\\)|mean\\(\\)", features$V2)
keepcols <- c(keepcols, 562, 563)
MeanAndStdData <- TestAndTrainData[, keepcols]

## Find the mean for each variable for each Subject and Activity
library(data.table)
MeanAndStdDT <- data.table(MeanAndStdData)
SummaryData <- MeanAndStdDT[, lapply(.SD, mean), by=c("Subject", "Activity")]

## Write the Summary Data to a text file
write.table(SummaryData, file = "./data/SummaryData.txt", row.names = FALSE)