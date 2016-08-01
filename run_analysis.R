tidyData <- function(fileURL) {
  
  ## load reshape2 library
  library(plyr)
  library(reshape2)

  ## grab current directory to return to at the end
  curdir <- getwd()
  
  ## if there is not a data directory, create one
  if(!file.exists("data")) {
    dir.create("data")
  }
  
  ## download the zip file and capture the date at which the download occurs 
  download.file(fileURL,destfile="./data/assign.csv",method="curl")
  dateDownloaded <- date()
  
  ## set working directory to data file and open zip file
  setwd("./data")
  unzip("assign.csv")
 
  ## change working directory to unzipped directory
  setwd("UCI HAR Dataset") 
  
  ## read relevant files in from directory
  features <- read.table("features.txt")
  activity_labels <- read.table("activity_labels.txt")
  subject_test <- read.table("test/subject_test.txt")
  X_test <- read.table("test/X_test.txt")
  y_test <- read.table("test/y_test.txt")
  subject_train <- read.table("train/subject_train.txt")
  X_train <- read.table("train/X_train.txt")
  y_train <- read.table("train/y_train.txt")
  
  ## Assignment point 1: 
  ##  Merge the training and the test sets to create one data set.
  ## This code appends training set data to test set data 
  X <- rbind(X_test, X_train)
  y <- rbind(y_test, y_train)
  subject <- rbind(subject_test, subject_train)
  
  ## rename the columns in X with the descriptive observation names in features
  names(X) <- features$V2

  ## Assignment point 2: 
  ##    Extract only the measurements on the mean and standard deviation for each measurement. 
  ## get the index values for mean (idx1) and std (idx2) values and combine those
  ## NOTE: I am interpreting this to include only those variables which end in either mean()
  ##or mean()-X (or Y or Z) and the same for std() so not including others (e.g. Angle(,gravityMean) 
  idx1 <-grep("[Mm][Ee][Aa][Nn]\\(\\)(-[XxYyZz])?", names(X))
  idx2 <-grep("[Ss][Tt][Dd]\\(\\)(-[XxYyZz])?", names(X))
  idx <- sort(c(idx1,idx2))
  ## take the subset of X that includes only the desired mean/std columns
  X <- X[,idx]
  
  ## Assignment point 3: 
  ##    Use descriptive activity names to name the activities in the data set
  ## join the activity_labels and y dataframes by V1 (activity code) to create 
  ## a dataframe that has a descriptive activity label for each data point in X
  ## then use cbind to attach the activity labels to the data
  y <- join(y, activity_labels, by="V1")

  ## Assignment point 4:
  ##    Appropriately labels the data set with descriptive variable names. 
  X <- cbind(y$V2,X)
  ## rename the first column "activity"
  names(X)[1] <- "activity"
  
  ## use cbind to add the subject ID numbers (subject) to the observations (X)
  X <- cbind(subject, X)
  ## rename the first column "subjectID"
  names(X)[1] <- "subjectID"
  
  ## reorder X by subjectID and by activity
  X <- X[order(X$subjectID,X$activity),]
  
  ## Assignment point 5:
  ##  From the data set in step 4, creates a second, independent tidy data set 
  ##  with the average of each variable for each activity and each subject.  

    ## first melting dataset so that the id variables are activity and subjectID
  ## the variable now contains all the different types of observations, so I 
  ## have renamed it observationType
  Xmelt <- melt(X, id = c("activity","subjectID"), variable.name="observationType")
  
  ## taking melted dataset and averaging over the different observationTypes
  ## this creates a dataset with means for each subject and activity type
  Xmeans <- dcast(Xmelt, subjectID +  activity ~ observationType, mean)  
  
  ## prepend "mean of" to the name of each of the observation types
  meanNames <- paste("mean of", names(Xmeans)[3:length(names(Xmeans))])
  names(Xmeans)[3:length(names(Xmeans))] <- meanNames 
  
  ## return user to original directory
  setwd(curdir) 
  
  ## write the table to that directory
  write.table(Xmeans, file = paste0("TidyDataset.txt"), row.names=FALSE)
 
  ## return the date the raw data was downloaded 
  dateDownloaded
}
