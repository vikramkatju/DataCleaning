---
title: "CodeBook.Rmd"
author: "Vikram Katju"
date: "7/26/2020"
output: 
  html_document: 
    keep_md: yes
---



##Introduction
This document gives details about the variables in the dataset. as well as any transformations that were performed in the course of cleaning up the data.

##Data Location and Files
The original data was scattered across multiple files in the UCI HAR dataset. Only a subset of all the UCI HAR data files were used to perform the required analysis. 

##Data Cleaning
The train and test sets are merged together using the rbind function.The subject id and the activity describing the observations were added as new variables in the dataset.

##Extraction of Mean and Standard Deviation
The grep command was used to extract the mean and standard deviation of a given feature

##Giving Descriptive names to activity numbers
The numbers given in the activity data are converted into descriptive names using the information provided in the 'activity_labels.txt' file.

##Building a tidy dataset
A tidy dataset was built by obtaining the mean values of features grouped by activitylabel and subject. For each subject and activity type we determined mean values over all activities of that type.

##Variables of interest
The variables of interest in the UCI HAR dataset that were used in this analysis were:

1. subject: The subject's unique ID
2. activity.name: The action the subject is taking (possible values: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)

3. Mean and standard deviation values for only the following features were computed (the original UCI HAR dataset included other features which were not used in this study):

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

The features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.(Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


