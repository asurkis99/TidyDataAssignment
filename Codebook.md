# TidyDataAssignment Codebook

## Study Design 
Data collected from 30 volunteers (19-48 years old) performing each of six activities wearing a smartphone (Samsung Galaxy S II) on the waist. Data captured with embedded accelerometer and gyroscope was 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50 Hz. 

This project read in raw data, combined test and training data, pulled out only mean() and std() of observations, then averaged over those mean() and std() for each observation type for each volunteer and each activity type.

Further details of raw data are in the README.md file and the README.txt file in directory ./data/UCI HAR dataset.

## Data Dictionary

Variable Name | Variable type | Variable description  | Possible values
------------- | ------------- | --------------------  | ---------------
subjectID     |  Integer      | Unique identifier for each subject on which measurements were made  | integer values 1-30
activity      |  Character    | Description of activity subject is engaged in when observations are made    | 6 possible values: WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRs, SITTING, STANDING, LAYING
mean of [observation] | numeric | this is a mean value calculated for each observation type where the mean is for a given subject and activity | normalized values between -1 and 1

See section below for explanations of the each individual observation type, described below as "features". 

##Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

There was a set of variables that were estimated from these signals, but for the purposes of this study, only the following two were used:

mean(): Mean value
std(): Standard deviation

Note above that there are 8 variables for which X, Y, and Z values were captured and 9 variables for which only a single value was captured, for a total of 8x3 + 9 = 33 observation types. For each of those, this project looks at both mean and standard deviation, so a total of 33x2 = 66 observation types




The complete list of variables of each feature vector is available in 'features.txt'
