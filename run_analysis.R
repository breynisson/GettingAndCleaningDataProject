# Read data. The run_analysis.R file should be in same working directory as 'UCI HAR Dataset' folder
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", quote="\"")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", quote="\"")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", quote="\"")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", quote="\"")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", quote="\"")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", quote="\"")
features <- read.table("UCI HAR Dataset/features.txt", quote="\"")

# Merge test and train datasets.
X_test_and_train <- rbind(X_test, X_train)
y_test_and_train <- rbind(y_test, y_train)

# Make a column with y data mapped to activty levels.
cut_y_data<-cut(y_test_and_train[,1], 6, 
                c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING'))

subject_test_and_train<-rbind(subject_test, subject_train)
names(subject_test_and_train)<-"subject"

# Read column names from features.txt files.
ulist<-unlist(features['V2'])

# Set column names to lowercase.
ulist<-tolower(ulist)

# Remove parenthesis from column names.
ulist<-gsub("\\(\\)", "", ulist)

# Change "t" at start of column name to "Timedomain-"
ulist<-gsub("^t", "Timedomain-", ulist)

# Change "f" at start of column name to "Freqdomain-"
ulist<-gsub("^f", "Freqdomain-", ulist)

# Set the column names.
names(X_test_and_train)<-ulist

# Add subject to the dataset.
full_dataset<-cbind(X_test_and_train, y_test_and_train)
full_dataset$subject<-subject_test_and_train

# Add the activty desription to the dataset.
full_dataset$activity<-cut_y_data

# Add column name to activity dataset.
names(full_dataset$activity)<-"activity"

# Find indexes of colums containg means and std.
# Subset those colums into a new dataframe.
mean_columns<-grep("mean",features$V2)
means<-X_test_and_train[,mean_columns]

std_columns<-grep("std",features$V2)
stds<-X_test_and_train[,std_columns]

# Create a datafram with the means, std, activity and subject.
reduced_set<-data.frame(full_dataset$subject, full_dataset$activity)
reduced_set<-cbind(reduced_set, means, stds)
# Set column name to activity dataset
names(reduced_set)[2] <- "activity"


df<-data.frame()
for(i in 1:30){
  by_subject<-reduced_set[reduced_set$subject==i,]
  subject_walking<-by_subject[by_subject$activity=='WALKING',]
  subject_walkingupstairs<-by_subject[by_subject$activity=='WALKING_UPSTAIRS',]
  subject_walkingdownstairs<-by_subject[by_subject$activity=='WALKING_DOWNSTAIRS',]
  subject_sitting<-by_subject[by_subject$activity=='SITTING',]
  subject_standing<-by_subject[by_subject$activity=='STANDING',]
  subject_laying<-by_subject[by_subject$activity=='LAYING',]
  
  # Find the means of all the measured data
  cmwalking<-colMeans(subject_walking[,3:81])
  cmwalkingupstairs<-colMeans(subject_walkingupstairs[,3:81])
  cmwalkingdownstairs<-colMeans(subject_walkingdownstairs[,3:81])
  cmsitting<-colMeans(subject_sitting[,3:81])
  cmstanding<-colMeans(subject_standing[,3:81])
  cmlaying<-colMeans(subject_laying[,3:81])
  
  # Put the means into a new data frame. 
  # Add the Subject and Activity to the data frame.
  df<-rbind(df, cmwalking)
  df<-rbind(df, cmwalkingupstairs)
  df<-rbind(df, cmwalkingdownstairs)
  df<-rbind(df, cmsitting)
  df<-rbind(df, cmstanding)
  df<-rbind(df, cmlaying)

  # Remove temp variables.
  rm(by_subject)
  rm(subject_walking)
  rm(subject_walkingupstairs)
  rm(subject_walkingdownstairs)
  rm(subject_sitting)
  rm(subject_standing)
  rm(subject_laying)
  rm(cmwalking)
  rm(cmwalkingupstairs)
  rm(cmwalkingdownstairs)
  rm(cmsitting)
  rm(cmstanding)
  rm(cmlaying)
}

# Set activity and subject columns for new data frame.
act<-c("WALKING", "WALKING UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
activity<-rep(act, 30)
subject<-rep(1:30, each=6)
df<-cbind(activity, df)
df<-cbind(subject, df)

# Set column names.
colnames_set<-names(reduced_set)
names(df)<-colnames_set

# Write the dataframe to file
write.table(df, file="GettingAndCleaningDataCourseProjectTidyDataSet.txt", col.names=TRUE)
