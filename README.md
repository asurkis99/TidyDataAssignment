# TidyDataAssignment
JHU Coursera Getting and Cleaning Data class project

## Input file
The raw data for this project is obtained by downloading a zipped file from the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This is then unzipped and results in the following file within the directory "UCI HAR dataset":
* activity\_labels.txt: codes and labels for each subject activity
* features\_info.txt:  description of variables in the X\_test and X\_training sets
* features.txt: list of all features variables
* README.txt: description of dataset 
* test directory
   + subject\_test.txt:  list of subjectIDs for each observation in test set
   + X\_test.txt:  data for all observations in test set
   + y\_test.txt:  list of activity codes for each observation in test set
   + Inertial Signals directory:  not used for this project
* training directory
   + subject\_training.txt: list of subjectIDs for each observation in training set
   + X\_training.txt: data for all observations in training set
   + y\_training.txt: list of activity codes for each observation in training set
   + Inertial Signals directory:  not used for this project
   
## Creating tidy dataset
The following steps were used to create the tidy dataset:
* Training data is appended to test data for each of test/training files: y, X, subject
* The non-descriptive names in the training/test sets are replaced by the descriptive variable names in the features.txt file
* The mean and standard deviation (std) observation columns are pulled out of the dataset
* A join is used to attach the activity labels to each of the activity codes in the variable y, which has an activity code for each observation
* The subject IDs and the activity labels are added as the first two columns to the data file
* The dataset is then sorted by subject ID and by activity type
* The melt command from library reshape2 is used to reshape the dataset as follows: 
   + subjectID and activity are the ID variables
   + a new variable "observationType" is created that lists each type of observation 
   + the new melted dataset now has 4 columns and the length is now the original number of observations multiplied by the number of observation types
* The dcast command is used to average over each of the observation types for each subjectID and activity, so that there is now a tidy dataset with 180 rows (30 subjects x 6 activity types) and 68 columns (66 observation types + subject ID + activity)

## Output
The file is written to the directory in which the user runs the program and has the name TidyDataset\_YYYYMMDD\_HHMM where the date/time listed is when the raw data was downloaded



