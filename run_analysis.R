library(dplyr)

# Download the files

path <- getwd()
zipurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zipurl, file.path(path, "masterdata.zip"))
unzip(zipfile = "masterdata.zip")

# Set a new working directory to source file location

setwd("~/Getting and Cleaning Data/UCI HAR Dataset")


# 1. Merge the training and the test sets to create one data set

# read train data set 
x_train   <- read.table("./train/X_train.txt")
y_train   <- read.table("./train/Y_train.txt") 
subject_train <- read.table("./train/subject_train.txt")

# read test data set
x_test   <- read.table("./test/X_test.txt")
y_test   <- read.table("./test/Y_test.txt") 
subject_test <- read.table("./test/subject_test.txt")

# merge the training and test data sets
x_all   <- rbind(x_train, x_test)
y_all   <- rbind(y_train, y_test) 
subject_all <- rbind(subject_train, subject_test) 


# 2. Extracts only the measurements on the mean and standard deviation for each measurement 

# read features 
features <- read.table("./features.txt")

# Extract mean and standard deviation measurements
extract_features <- features[grep("(mean|std)\\(\\)", features[,2]),]
head(extract_features)


# 3. Appropriately label the data set with descriptive variable names

# label the data set
x_all <- x_all[,extract_features[,1]]
colnames(x_all)   <- extract_features[,2]
colnames(y_all)   <- "activity"
colnames(subject_all) <- "subject"  

# expand abbreviations
names(x_all) <- sub("^t", "time", names(x_all))
names(x_all) <- sub("^f", "freq", names(x_all))

# merge final data set
finaldataset <- cbind(subject_all, y_all, x_all)


# 4. Use descriptive activity names to name the activities in the data set

# read activity labels 
activity_labels <- read.table("./activity_labels.txt") 

finaldataset$activity <- factor(finaldataset$activity, levels = activity_labels[,1], labels = activity_labels[,2]) 
finaldataset$subject  <- as.factor(finaldataset$subject) 
head(finaldataset)

# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject    
average_values <- finaldataset %>% 
  group_by(activity, subject) %>%
  summarize_all(funs(mean)) 
head(average_values)
write.table(average_values, file = "./tidy_data_set.txt", row.names = FALSE, col.names = TRUE) 

