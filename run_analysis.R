X_test <- read.table("~/src/coursera/GettingAndCleaningData/UCI HAR Dataset/test/X_test.txt", quote="\"")
X_train <- read.table("~/src/coursera/GettingAndCleaningData/UCI HAR Dataset/train/X_train.txt", quote="\"")
y_test <- read.table("~/src/coursera/GettingAndCleaningData/UCI HAR Dataset/test/y_test.txt", quote="\"")
y_train <- read.table("~/src/coursera/GettingAndCleaningData/UCI HAR Dataset/train/y_train.txt", quote="\"")
subject_test <- read.table("~/src/coursera/GettingAndCleaningData/UCI HAR Dataset/test/subject_test.txt", quote="\"")
subject_train <- read.table("~/src/coursera/GettingAndCleaningData/UCI HAR Dataset/train/subject_train.txt", quote="\"")

features <- read.table("~/src/coursera/GettingAndCleaningData/UCI HAR Dataset/features.txt", quote="\"")

X_test_and_train <- rbind(X_test, X_train)
y_test_and_train <- rbind(y_test, y_train)

ulist<-unlist(features['V2'])
names(X_test_and_train)<-ulist


# Find indexes of colums containg means.
# Subset those colums into a new dataframe.
mean_columns<-grep("mean",features$V2)
means<-X_test_and_train[,mean_columns]

std_columns<-grep("std",features$V2)
std<-X_test_and_train[,std_columns]