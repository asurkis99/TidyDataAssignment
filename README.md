# TidyDataAssignment README
JHU Coursera Getting and Cleaning Data class project

# Running the script
To run the script, do the following:
* fileURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
* source("./run_analysis.R")
* tidyData(fileURL) -- this will return the date run
To see the final tidy dataset:
* tidyDataset <- read.table("TidyDataset.txt")
* View(tidyDataset)

## Input file
The raw data for this project is obtained by downloading a zipped file from the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The files consist of a set of observations about 30 subjects doing each of 6 activities, with the data divided between a training set and a test set

This is then unzipped and results in the following file within the directory "UCI HAR dataset":
* activity\_labels.txt: codes (1-6) and labels (e.g. WALKING) for each subject activity
* features\_info.txt:  description of the different types of observations for which the data is in the X\_test and X\_training sets
* features.txt: list of the descriptive names for all the observation types
* README.txt: description of dataset 
* test directory (contains data from 9 subjects)
   + subject\_test.txt:  list of subjectIDs for each observation in test set
   + X\_test.txt:  data for all observations in test set
   + y\_test.txt:  list of activity codes (1-6) for each observation in test set
   + Inertial Signals directory:  not used for this project
* training directory (contains data from 21 subjects)
   + subject\_training.txt: list of subjectIDs for each observation in training set
   + X\_training.txt: data for all observations in training set
   + y\_training.txt: list of activity codes (1-6) for each observation in training set
   + Inertial Signals directory:  not used for this project
   
## Creating tidy dataset
The following steps were used to create the tidy dataset:
* Training data is appended to test data for each of test/training files: y, X, subject, creating a file with 10299 observations
* The non-descriptive names in the training/test sets are replaced by the descriptive variable names in the features.txt file
* The mean and standard deviation (std) observation columns are pulled out of the dataset, for a total of 66 observation types (note that I interpreted the instructions to include only those observation types that ended in either mean(), std(), mean()-[XYZ], or std()-[XYZ])
* A join is used to attach the activity labels to each of the activity codes in the variable y, which has an activity code for each observation
* The subject IDs and the activity labels are added as the first two columns to the data file
* The dataset is then sorted by subject ID and by activity type
* The melt command from library reshape2 is used to reshape the dataset as follows: 
   + subjectID and activity are the ID variables
   + a new variable "observationType" is created that lists each type of observation 
   + the new melted dataset is a tidy dataset with 4 columns: subjectID, activity, observationType, value. Note that the length (679734) is now the original number of observations (10299) multiplied by the number of observation types (66)
* The dcast command is used to average over each of the observation types for each subjectID and activity, so that there is now a tidy dataset with 180 rows (30 subjects x 6 activity types) and 68 columns (66 observation types + subject ID + activity) so that the mean of each observation type is listed for each activity by each subject

## Output
The file is written to the directory in which the user runs the program and has the name TidyDataset.txt 

For details about the contents of the file, please see the Codebook in this repo.


