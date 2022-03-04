# 1. PREPARATION 

# 1a. Create a subfolder within the current working directory and set the new folder as the new working directory

if (!file.exists("GettingAndCleaningData")){
  dir.create("GettingAndCleaningData")
}

setwd("GettingAndCleaningData")

# 1b. Load the necessary additional R packages

library(data.table) # load package for fast file reading use fread()
library(dplyr) # load package for data manipulation and aggregation using summarise()
library(stringr) # load package for working with strings, inlcuding str_detect()

# 1c. Download the dataset and unzip if the "Dataset.zip" file is not already present

if (!file.exists("Dataset.zip")){
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "Dataset.zip")
print(paste("UCI HAR Dataset downloaded and unzipped on ", Sys.time(), sep = ""))
unzip ("Dataset.zip")
} else {
  print("Dataset not downloaded again as it is already present")
}

# 2. READ THE DATA

# 2a. Read the main "test" and "train" data. fread() function from the data.table package used for speed

testData <- fread("UCI HAR Dataset/test/X_test.txt")
trainData <- fread("UCI HAR Dataset/train/X_train.txt")

# 2b. Read the "test" and "train" subjects, and name the columns

testSubjects <- fread("UCI HAR Dataset/test/subject_test.txt", col.names="subject")
trainSubjects <- fread("UCI HAR Dataset/train/subject_train.txt", col.names="subject")

# 2c. Read the "test" and "train" labels, and name the columns

testLabels <- fread("UCI HAR Dataset/test/y_test.txt", col.names="label")
trainLabels <- fread("UCI HAR Dataset/train/y_train.txt", col.names="label")

# 2d. Read the features

features <- fread("UCI HAR Dataset/features.txt", strip.white=TRUE, stringsAsFactors=FALSE, col.names = c("Feature.Ref", "Feature"))


# 2e. Read the Activity Labels

activitylabels<-fread("UCI HAR Dataset/activity_labels.txt", col.names = c("Label.Ref", "Label"))

# 3. MERGE THE DATA

mergeTest<-cbind(testSubjects, testLabels, testData)
mergeTrain<-cbind(trainSubjects, trainLabels, trainData)
mergeAll<-rbind(mergeTest, mergeTrain)

# 4. REPLACE NUMERIC LABELS WITH DESCRIPTIVE LABELS
#   AND APPLY DESCRIPTIVE COLUMN NAMES, REMOVING NON-ALPHANUMERIC SYMBOLS

mergeAll <- merge(mergeAll, activitylabels, by.x = "label", by.y = "Label.Ref")
mergeAll <- mergeAll %>%
  select(subject, Label, V1:V561)

descriptiveColumnNames<-c("subject", "label", features$Feature)
names(mergeAll)<-gsub("[^[:alpha:]]", "", descriptiveColumnNames)

# 5. SELECT ONLY THOSE COLUMNS RELATING TO MEAN AND ST
#     select only those features which include "mean" and "std" in their names
#     but excluding "meanFreq" which does not appear to be a genuine mean

mergeMeansStd <- mergeAll %>%
  select(subject, label, contains("mean"), contains("std")) %>%
  select(-contains("meanFreq"))

#6. FINALISE FIRST TIDY DATA SET

tidyData<-mergeMeansStd

#7. CALCULATE THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT AND
#  ASSIGN TO AN INDEPENDENT TIDY DATA SET

tidy2 <- tidyData %>%
  group_by(subject, label)%>%
  summarise_each(funs(mean))%>%
  ungroup()%>%
  arrange(subject, label)


#8. WRITE THE DATA TO A "TXT" FILE

write.table(tidy2, file="finaltidy.txt", sep="\t", row.names=FALSE)
