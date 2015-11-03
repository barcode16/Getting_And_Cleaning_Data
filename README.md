## The Aim

The run_analysis.R script reads data from a number of source files and turns it into combined tidy data set meeting the criteria set out in the Coursera Getting And Cleaning Data Week 3 Project.

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The project requirement is to submit: 1) a tidy data set as described below, 2) a link to a Github repository with the script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that was performed to clean up the data called CodeBook.md. This README.md file explains how the script works.  

## The Files

The run_analysis.R script downloads the data automatically from this link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

If the file has already been downloaded, the file will not be downloaded again. 

The zipped files will by default be extracted to a folder named "UCI HAR Dataset" which will be placed in your R Working Directory . 

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

1. Step 1 - Download and unzip the data (if necessary) and load the required R packages (this analysis uses *dplyr*, *data.table* and *stringr*)
2. Step 2 - Read all of the required data from the 8 source data files (steps 2a-2d within the R script)
3. Step 3 - Merges the training and test sets to create a one data set.
4. Step 4 - Replace numeric labels with descriptive labels and apply descriptive column names, using gsub() to remove non alphnumeric symbols from the variable names (which makes it easier to handle the names with R)
5. Step 5 -  Filter the data to only include the measurements on the mean and standard deviation for each measurement. Variables which contain the text "MeanFreq" are *not* included, as these do not appear to be measurements on the mean of the measurement in question. 
6. Step 6 - Finalise the tidy data set by assigning the results from the above steps to a new variable. 
7. Step 7 - Calculate the average of each variable for each subject and activity (using functions from the **dplyr** package) and assign to a second final tidy data set.
8. Step 8 - Write the tidy data to a "txt" file. 



## The Source Data

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

## The Final Data

A tidy data set showing the averages of each mean and standard deviation measurement, resulting in 180 observations (the means for 30 subjects across 6 activities) of 75 variables (had "MeanFreq" variables been included, this would have been 88 variables). 