# Code Book

The project is based on [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

**Data Set Information:**

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, it captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

**Attribute Information:**

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

**Transformations Performed To Clean Up The Data:**

1. The training and the test data sets were merged to create one data set.
2. From the new data set, only the measurements on the mean and standard deviation for each measurement are extracted. 
3. The activities in the data set are named with descriptive activity names. 
4. The data set is appropriately labeled with descriptive variable names and abbreviations like "t" and "f" and typos like "BodyBody" are renamed to "Time", "Freq" and "Body". 
5. A second, independent tidy data set with the average of each variable for each activity and each subject is created.

**The Transformed Data Structure Inlcudes The Following Elements:**

The data structure consists of two factor variables, and 68 numeric variables:

- subject                       : Factor w/ 30 levels 
- activity                      : Factor w/ 6 levels 
- timeBodyAcc-mean()-X          : num  
- timeBodyAcc-mean()-Y          : num  
- timeBodyAcc-mean()-Z          : num  
- timeBodyAcc-std()-X           : num  
- timeBodyAcc-std()-Y           : num  
- timeBodyAcc-std()-Z           : num  
- timeGravityAcc-mean()-X       : num  
- timeGravityAcc-mean()-Y       : num  
- timeGravityAcc-mean()-Z       : num  
- timeGravityAcc-std()-X        : num  
- timeGravityAcc-std()-Y        : num  
- timeGravityAcc-std()-Z        : num  
- timeBodyAccJerk-mean()-X      : num  
- timeBodyAccJerk-mean()-Y      : num  
- timeBodyAccJerk-mean()-Z      : num  
- timeBodyAccJerk-std()-X       : num  
- timeBodyAccJerk-std()-Y       : num  
- timeBodyAccJerk-std()-Z       : num  
- timeBodyGyro-mean()-X         : num  
- timeBodyGyro-mean()-Y         : num  
- timeBodyGyro-mean()-Z         : num  
- timeBodyGyro-std()-X          : num  
- timeBodyGyro-std()-Y          : num  
- timeBodyGyro-std()-Z          : num  
- timeBodyGyroJerk-mean()-X     : num  
- timeBodyGyroJerk-mean()-Y     : num  
- timeBodyGyroJerk-mean()-Z     : num  
- timeBodyGyroJerk-std()-X      : num  
- timeBodyGyroJerk-std()-Y      : num  
- timeBodyGyroJerk-std()-Z      : num  
- timeBodyAccMag-mean()         : num  
- timeBodyAccMag-std()          : num 
- timeGravityAccMag-mean()      : num  
- timeGravityAccMag-std()       : num  
- timeBodyAccJerkMag-mean()     : num  
- timeBodyAccJerkMag-std()      : num  
- timeBodyGyroMag-mean()        : num  
- timeBodyGyroMag-std()         : num  
- timeBodyGyroJerkMag-mean()    : num  
- timeBodyGyroJerkMag-std()     : num  
- freqBodyAcc-mean()-X          : num  
- freqBodyAcc-mean()-Y          : num  
- freqBodyAcc-mean()-Z          : num  
- freqBodyAcc-std()-X           : num  
- freqBodyAcc-std()-Y           : num  
- freqBodyAcc-std()-Z           : num  
- freqBodyAccJerk-mean()-X      : num  
- freqBodyAccJerk-mean()-Y      : num  
- freqBodyAccJerk-mean()-Z      : num  
- freqBodyAccJerk-std()-X       : num  
- freqBodyAccJerk-std()-Y       : num  
- freqBodyAccJerk-std()-Z       : num  
- freqBodyGyro-mean()-X         : num  
- freqBodyGyro-mean()-Y         : num  
- freqBodyGyro-mean()-Z         : num  
- freqBodyGyro-std()-X          : num  
- freqBodyGyro-std()-Y          : num  
- freqBodyGyro-std()-Z          : num  
- freqBodyAccMag-mean()         : num  
- freqBodyAccMag-std()          : num  
- freqBodyAccJerkMag-mean()     : num  
- freqBodyAccJerkMag-std()      : num  
- freqBodyGyroMag-mean()        : num  
- freqBodyGyroMag-std()         : num  
- freqBodyGyroJerkMag-mean()    : num  
- freqBodyGyroJerkMag-std()     : num  
