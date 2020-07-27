---
title: "README.Rmd"
author: "Vikram Katju"
date: "7/27/2020"
output: 
  html_document: 
    keep_md: yes
---

##Objective
The objective of this project was to take the given dataset (comprising multiple files), and perform a series of transformations on a subset of the dataset so as to clean the selected data for later analysis.

The following files from the initial dataset were used in this work:

features.txt - includes the descriptions for features measured
train/X_train.txt - includes the measurements of the features in train set
test/X_test.txt - includes the measurements of the features in test set
train/subject_train.txt - subject for each measurement from the train set
test/subject_test.txt - subject for each measurement from the test set
train/y_train.txt - activity for each measurement from the train set
test/y_test.txt - activity for each measurement from the test set


##File Descriptions
README.md: Some general information regarding the project and each file.
CodeBook.md: Describes the variables, and details about any transformations carried out to clean the dataset.
run_analysis.R: Contains the code for loading, merging, and transforming the selected data from the given dataset.


