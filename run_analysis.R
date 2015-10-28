# 1. READ THE DATA

# 1a. Read the main "test" and "train" data.

testData <- read.table("UCI HAR Dataset/test/X_test.txt")
trainData <- read.table("UCI HAR Dataset/train/X_train.txt")

# 1b. Read the "test" and "train" subjects, and name the columns


testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names="subject")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names="subject")

# 1c. Read the "test" and "train" labels, and name the columns

testLabels <- read.table("UCI HAR Dataset/test/y_test.txt", col.names="label")
trainLabels <- read.table("UCI HAR Dataset/train/y_train.txt", col.names="label")

# 1d. Read the features
#     find the indices of those observations which include "mean" or "std"
#     create new variable consisting of the subset of features only including "mean" and "std"

features <- read.table("UCI HAR Dataset/features.txt", strip.white=TRUE, stringsAsFactors=FALSE)
meanstdIndices<-grep("mean\\(\\)|std\\(\\)", features$V2)
featuresMeanStd<-features[c(meanstdIndices), ]

# 1e. Read the Activity Labels

activitylabels<-read.table("UCI HAR Dataset/activity_labels.txt")

# 2. MERGE THE DATA

mergeTest<-cbind(testSubjects, testLabels, testData)
mergeTrain<-cbind(trainSubjects, trainLabels, trainData)
mergeAll<-rbind(mergeTest, mergeTrain)
mergeMeanStd<-mergeAll[, c(1, 2, featuresMeanStd$V1+2)]

# 3. REPLACE NUMERIC LABELS WITH DESCRIPTIVE LABELS
#   AND APPLY DESCRIPTIVE COLUMN NAMES, REMOVING NON-ALPHANUMERIC SYMBOLS

mergeMeanStd$label <- activitylabels[mergeMeanStd$label, 2]

descriptiveColumnNames<-c("subject", "label", featuresMeanStd$V2)
colnames(mergeMeanStd)<-gsub("[^[:alpha:]]", "", descriptiveColumnNames)

#4 FINALISE FIRST TIDY DATA SET

tidyData<-mergeMeanStd

#5 CALCULATE THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT AND
#  ASSIGN TO AN INDEPENDENT TIDY DATA SET

tidy2<-aggregate(tidyData[, 3:ncol(tidyData)], list(subject = tidyData$subject, label = tidyData$label), mean)

#6 WRITE THE DATA TO A "TXT" FILE

write.table(tidy2, file="finaltidy.txt", sep="\t", row.names=FALSE)
