library(dplyr)

# Download and unzip the files

path <- getwd()
zipurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zipurl, file.path(path, "masterdata.zip"))
unzip(zipfile = "masterdata.zip")

# Set a new working directory to source file location

setwd("~/Getting and Cleaning Data/UCI HAR Dataset")


# 1. Merge the training and the test sets to create one data set

# Read the data set 
features <- read.table('./features.txt', col.names=c("feature_No.", "feature_label"))
x_train <- read.table('./train/X_train.txt', col.names = features$feature_label)
x_test <- read.table('./test/X_test.txt', col.names = features$feature_label)
y_train <- read.table('./train/y_train.txt', col.names = "activity_code")
y_test <- read.table('./test/y_test.txt', col.names = "activity_code")
activities <- read.table('./activity_labels.txt', col.names=c("activity_ID", "activity_label"))
subject_train <- read.table('./train/subject_train.txt', col.names = "subject")
subject_test <- read.table('./test/subject_test.txt', col.names = "subject")

# Merge the training and test data sets
x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)
subject_all <- rbind(subject_train, subject_test)
df <- cbind(subject_all, y_all, x_all)
head(df)

# 2. Extract only the measurements on the mean and standard deviation for each measurement 
finaldataset <- df %>%
  select(subject, activity_code, contains("mean"), contains("std"))

# 3. Use descriptive activity names to name the activities in the data set
finaldataset$activity_code <- activities[finaldataset$activity_code,2]
head(finaldataset)

# 4. Appropriately label the data set with descriptive variable names
names(finaldataset)<-sub("^t", "Time", names(finaldataset))
names(finaldataset)<-sub("^f", "Freq", names(finaldataset))
names(finaldataset)<-sub("BodyBody", "Body", names(finaldataset))
names(finaldataset)<-sub("mean", "Mean", names(finaldataset))
names(finaldataset)<-sub("std", "STD", names(finaldataset))
head(finaldataset)

# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject    
average_values <- finaldataset %>%
  group_by(activity_code, subject) %>%
  summarise_all(funs(mean))
head(average_values)
write.table(average_values, "./tidy_data_set.txt", row.names = FALSE)
