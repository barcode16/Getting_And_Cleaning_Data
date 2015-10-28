## The Aim

The run_analysis.R script reads data from a number of source files and turns it into combined tidy data set meeting the criteria set out in the Coursera Getting And Cleaning Data Week 3 Project.

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The project requirement is to submit: 1) a tidy data set as described below, 2) a link to a Github repository with the script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that was performed to clean up the data called CodeBook.md. This README.md file explains how the script works.  

## The Files

The run_analysis.R script requires the data files downloaded via this link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The zipped files will by default be extracted top a folder named "UCI HAR Dataset" which should be placed in your R Working Directory to enable the run_analysis.R script to work. The script requires the following 8 data files, sited in the locations shown (the path is from your R Working Directory):

1. /UCI HAR Dataset/test/X_test.txt
2. /UCI HAR Dataset/train/X_train.txt
3. /UCI HAR Dataset/test/subject_test.txt
4. /UCI HAR Dataset/train/subject_train.txt
5. /UCI HAR Dataset/test/y_test.txt
6. /UCI HAR Dataset/train/y_train.txt
7. /UCI HAR Dataset/features.txt
8. /UCI HAR Dataset/activity_labels.txt

The source data set includes other data files which are not used by the run_analysis.R script.

## The run_analysis.R Script

The course instructions require the run_analysis.R script to achieve the following:

1. You should create one R script called run_analysis.R that does the following. 
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names. 
6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The submitted script file achieves all of the above objectives using the following steps, each of which is indicated using comments in the script itself:

1. Step 1 - Read all of the required data from the 8 source data files, extracting only the measurements on the mean and standard deviation for each measurement.
2. Step 2 - Merges the training and test sets to create a one data set.
3. Step 3 - Replace numeric labels with descriptive labels and apply descriptive column names, using gsub() to remove non alphnumeric symbols from the variable names (which makes it easier to handle the names with R)
4. Step 4 - Finalise the first tidy data set.
5. Step 5 - Calculate the average of each variable for each subject and activity and assign to a second final tidy data set.
6. Step 6 - Write the tidy data to a "txt" file. 

## The Source Data

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

## The Final Data

A tidy data set showing the averages of each mean and standard deviation measurement, resulting in 180 observations (the means for 30 subjects across 6 activities) of 68 variables. 