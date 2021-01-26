The Codebook
This codebook describes the steps and the outcome that were required for Course Prgoject ('Getting and Cleaning Data')

The work was performed in 5 steps as it was required:

Step 1 (Merges the training and the test sets to create one data set)

Under the URL(https://github.com/romanyaniv/Getting-and-Cleaning-Data-Course-Project.git) was created the github repository.
Localy on the PC was download zip file 'UCI HAR Dataset'
The contained files were assighn to the following variables:
'features', 'activity_labels', 'subject_test', 'x_test, y_test', 'subject_train', 'x_train', 'y_train'
Then the data from the datasets (x_train, x_test, y_train, y_test, subject_train, subject_test) was merged into the 'Data'
variable.

Step 2 (Extracts only the measurements on the mean and standard deviation for each measurement)

In this step from the 'Data' were extracted only the measurments of standart deviation and mean.
The new data were seved into 'NewData variable'.

Step 3 (Uses descriptive activity names to name the activities in the data set)

In this step to the 'NewData' were added descriptive names from the data set 'activity_labels'

Step 4 (Appropriately labels the data set with descriptive variable names)

Then the names were fixed. First of all, the variable name 'code' was replaced on appropriate name 'Activity'.
Other variabled were also fixed:
Insted 'Acc' - 'Accelerometer'
Insted 'Gyro' - 'Gyroscope'
Insted 'BodyBody' - 'Body'
Insted 'Mag' - 'Magnitude'
Insted 'f' - 'Frequency'
Insted 't' - 'Time'

Step 5 (From the data set in step 4, creates a second, independent tidy data set 
        with the average of each variable for each activity and each subject)

Finaly, the independent 'OutcomeData' was created based on the 'NewData' with the avarage of each variable of each activity and each subject.
