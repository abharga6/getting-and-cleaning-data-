Data source
===========

The data linked to from the course website represent data collected from
the accelerometers from the Samsung Galaxy S smartphone. A full
description is available at the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Here are the data for the project:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

Analysis
========

Following activities are performed on the above dataset

1.  Merges the training and the test sets to create one data set.

2.  Extracts only the measurements on the mean and standard deviation
    for each measurement.

3.  Uses descriptive activity names to name the activities in the data
    set

4.  Appropriately labels the data set with descriptive activity names.

5.  Creates a second, independent tidy data set with the average of each
    variable for each activity and each subject.

Variables explaination in the second data created using the R script attached with this code book
=================================================================================================

These time domain signals were captured at a constant rate of 50 Hz.
Then they were filtered using a median filter and a 3rd order low pass
Butterworth filter with a corner frequency of 20 Hz to remove noise.
Similarly, the acceleration signal was then separated into body and
gravity acceleration signals (timeBodyAccelerometer-XYZ and
timeGravityAccelerometer-XYZ) using another low pass Butterworth filter
with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (timeBodyAccelerometerJerk-XYZ
and timeBodyGyroscopeJerk-XYZ). Also the magnitude of these
three-dimensional signals were calculated using the Euclidean norm
(timeBodyAccelerometerMagnitude, timeGravityAccelerometerMagnitude,
timeBodyAccelerometerJerkMag, timeBodyGyroscopeMagnitude,
timeBodyGyroscopeJerkMagnitude).

Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing frequencyBodyAccelerometer-XYZ,
frequencyBodyAccelerometerJerk-XYZ, fBodyGyro-XYZ,
frequencyBodyAccelerometerJerkMagnitude, frequencyBodyGyroMagnitude,
frequencyBodyGyroJerkMagnitude.

These signals were used to estimate the mean(variables) of the feature
vector for each activity and subject:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

timeBodyAccelerometer-XYZ

timeGravityAccelerometer-XYZ

timeBodyAccelerometerJerk-XYZ

timeBodyGyroscope-XYZ

timeBodyGyroscopeJerk-XYZ

timeBodyAccelerometerMagnitude

timeBodyAccelerometerJerkMagnitude

timeBodyGyroscopeMagnitude

timeBodyGyroscopeJerkMagnitude

frequencyBodyAccelerometer-XYZ

frequencyBodyAccelerometerJerk-XYZ

frequencyBodyGyroscope-XYZ

frequencyBodyAccelerometerMagnitude

frequencyBodyAccelerometerJerkMagnitude

frequencyBodyGyroscopeMagnitude

frequencyBodyGyroscopeJerkMagnitude

The set of variables that were estimated from these signals are:

mean(): Mean value std(): Standard deviation
