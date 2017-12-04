## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Installing required functions if not installed already 
if (!require("data.table")) {
  install.packages("data.table")
}
if (!require("dplyr")) {
  install.packages("data.table")
}

#Loading Required functions in R 
require("data.table")
require("dplyr")

#Downloading the zipped file in a temporary folder in the working directory 
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp)

#Unzipping the folder in the working directory and removing temporary folder
unzip(temp)
rm(temp)

#Checking the files downloaded
list.files("./UCI HAR Dataset")
list.files("./UCI HAR Dataset/train")
list.files("./UCI HAR Dataset/test")

## 1. Merges the training and the test sets to create one data set

#Reading the measurement datasets from train and test
trd <- read.table("./UCI HAR Dataset/train/X_train.txt")
ted <- read.table("./UCI HAR Dataset/test/X_test.txt")

#merging two datasets
data <- rbind(trd,ted)

#reading the variable names dataset and assigning column names to our dataset
features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)
features <- features[,2]
colnames(data) <- features

#reading the subject and activity datasets for test and merging 
ted_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
ted_activity <- read.table("./UCI HAR Dataset/test/y_test.txt")
ted_sa <- cbind(ted_subject,ted_activity)

#Reading the subject and activity datasets for traing and merging
trd_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trd_activity <- read.table("./UCI HAR Dataset/train/y_train.txt") 
trd_sa <- cbind(trd_subject,trd_activity)

#merging above created datasets for creating a combined data set of activity and subject
subject_activity <-rbind(trd_sa,ted_sa)

#giving column names to above merged dataset
colnames(subject_activity)<- c("subject","activity")

#merging subject and activity dataset with the main data containing measurements
data<- cbind(subject_activity,data)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement

#grepping mean and std from coloumn names
colnames <- colnames(data)
a <- grep("mean\\(\\)|std\\(\\)", colnames)

#subsetting to get the required data 
data <- data[,c(1,2,a)]

## 3. Uses descriptive activity names to name the activities in the data set

#Changing activity variable in to a factor variable
data$activity<- factor(data$activity)

#Reading in activity labels data set and converting to character variable 
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_labels <- activity_labels[,2]
activity_labels <- as.character(activity_labels)

#releveling the activity variable in our dataset
levels(data$activity)<- activity_labels

## 4. Appropriately labels the data set with descriptive activity names.

#Renaming variables to make them more informative 
names(data)<-gsub("^t", "time", names(data))
names(data)<-gsub("^f", "frequency", names(data))
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Groupping data by activity and subject 
data1<- group_by(data,activity, subject)

#calculating means for each subject and activity of every variable
data2<- summarise_all(data1, funs(mean))

#creating second data set
write.table(data2, file = "tidydata.txt", sep=",", row.name=FALSE)







