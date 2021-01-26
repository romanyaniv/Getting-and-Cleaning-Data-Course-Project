## Getting and Cleaning Data Course Project

## Let's assign each dataset to a variable. 
##The zip file was downloaded directly to the github working directory which was set in advance.
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

## Creating one 'Data' from test set and training set
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Data <- cbind(Subject, Y, X)

## Extracting only the measurements on the mean and standard deviation for each measurement
NewData <- Data %>% select(subject, code, contains("mean"), contains("std"))

## Using descriptive activity names to name the activities in the data set
NewData$code <- activity_labels[NewData$code, 2]

## Assigning approptiate variable names
names(NewData)[2] = "activity"
names(NewData)<-gsub("Acc", "Accelerometer", names(NewData))
names(NewData)<-gsub("Gyro", "Gyroscope", names(NewData))
names(NewData)<-gsub("BodyBody", "Body", names(NewData))
names(NewData)<-gsub("Mag", "Magnitude", names(NewData))
names(NewData)<-gsub("^f", "Frequency", names(NewData))
names(NewData)<-gsub("tBody", "TimeBody", names(NewData))
names(NewData)<-gsub("-mean()", "Mean", names(NewData), ignore.case = TRUE)
names(NewData)<-gsub("angle", "Angle", names(NewData))
names(NewData)<-gsub("gravity", "Gravity", names(NewData))
names(NewData)<-gsub("-std()", "STD", names(NewData), ignore.case = TRUE)
names(NewData)<-gsub("^t", "Time", names(NewData))
names(NewData)<-gsub("-freq()", "Frequency", names(NewData), ignore.case = TRUE)

## Creating a data with the average of each variable
OutcomeData <- NewData %>% group_by(subject, activity) %>% summarise_all(funs(mean))
write.table(OutcomeData, "OutcomeData.txt", row.name=FALSE)

