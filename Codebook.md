##The Source Data

The main source for the information about the source data set is the README.txt file for the data set available from the data source link below. 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


#Source Data Abstract

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

* Title: Human Activity Recognition Using Smartphones Dataset
* Source:  UCI machine Learning Repository
* Data Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Data Set Characteristics: Multivariate, Time-Series


#Source Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

#Source Data Attribute Information

For each record, the following information is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


##The Tidy Data Variables

The original data set included 563 variables. The data transformation to produce the tidy data set included isolating only those variables which measured mean and standard deviation for each measurement. This resulted in a total of 68 variables. The first two variables in the tidy data set are

* Subject     integer     1...30 (representing each of the 30 test subjects)
* Label       factor      [WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING]

For the remaining variables, the following signals were used to estimate variables of the feature vector for each pattern: "-XYZ" is used to denote 3-axial signals in the X, Y and Z directions

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

* mean(): Mean value
* std(): Standard deviation


Variable names have been derived using the format:

Signal type + "mean" or "std", suffixed by X, Y or Z where appropriate to represent the axis of movement. 


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean-XYZ
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The final variables in the tidy data set represent the average values of the corresponding signal means and standard deviations. In full, these variables are:

* tBodyAccmeanX          : numeric 
* tBodyAccmeanY          : numeric
* tBodyAccmeanZ          : numeric 
* tBodyAccstdX           : numeric 
* tBodyAccstdY           : numeric 
* tBodyAccstdZ           : numeric 
* tGravityAccmeanX       : numeric 
* tGravityAccmeanY       : numeric 
* tGravityAccmeanZ       : numeric 
* tGravityAccstdX        : numeric 
* tGravityAccstdY        : numeric 
* tGravityAccstdZ        : numeric 
* tBodyAccJerkmeanX      : numeric 
* tBodyAccJerkmeanY      : numeric 
* tBodyAccJerkmeanZ      : numeric 
* tBodyAccJerkstdX       : numeric 
* tBodyAccJerkstdY       : numeric 
* tBodyAccJerkstdZ       : numeric 
* tBodyGyromeanX         : numeric 
* tBodyGyromeanY         : numeric 
* tBodyGyromeanZ         : numeric 
* tBodyGyrostdX          : numeric 
* tBodyGyrostdY          : numeric 
* tBodyGyrostdZ          : numeric 
* tBodyGyroJerkmeanX     : numeric 
* tBodyGyroJerkmeanY     : numeric 
* tBodyGyroJerkmeanZ     : numeric 
* tBodyGyroJerkstdX      : numeric 
* tBodyGyroJerkstdY      : numeric 
* tBodyGyroJerkstdZ      : numeric 
* tBodyAccMagmean         : numeric 
* tBodyAccMagstd          : numeric 
* tGravityAccMagmean      : numeric 
* tGravityAccMagstd       : numeric 
* tBodyAccJerkMagmean     : numeric 
* tBodyAccJerkMagstd      : numeric 
* tBodyGyroMagmean        : numeric 
* tBodyGyroMagstd         : numeric 
* tBodyGyroJerkMagmean    : numeric 
* tBodyGyroJerkMagstd     : numeric 
* fBodyAccmeanX          : numeric 
* fBodyAccmeanY          : numeric 
* fBodyAccmeanZ          : numeric 
* fBodyAccstdX           : numeric 
* fBodyAccstdY           : numeric 
* fBodyAccstdZ           : numeric 
* fBodyAccJerkmeanX      : numeric 
* fBodyAccJerkmeanY      : numeric 
* fBodyAccJerkmeanZ      : numeric 
* fBodyAccJerkstdX       : numeric .
* fBodyAccJerkstdY       : numeric 
* fBodyAccJerkstdZ       : numeric 
* fBodyGyromeanX         : numeric 
* fBodyGyromeanY         : numeric 
* fBodyGyromeanZ         : numeric 
* fBodyGyrostdX          : numeric 
* fBodyGyrostdY          : numeric 
* fBodyGyrostdZ          : numeric 
* fBodyAccMagmean         : numeric 
* fBodyAccMagstd          : numeric 
* fBodyBodyAccJerkMagmean : numeric 
* fBodyBodyAccJerkMagstd  : numeric 
* fBodyBodyGyroMagmean   : numeric 
* fBodyBodyGyroMagstd     : numeric 
* fBodyBodyGyroJerkMagmean: numeric 
* fBodyBodyGyroJerkMagstd : numeric
* angletBodyAccMeangravity: numeric
* angletBodyAccJerkMeangravityMean: numeric
* angletBodyGyroMeangravityMean: numeric
* angletBodyGyroJerkMeangravityMean: numeric
* angleXgravityMean       : numeric
* angleYgravityMean       : numeric
* angleZgravityMean       : numeric


##Transformation

The source data originally consisted of 10,299 observations of 563 variables. Transformation principally included:

* Extracting 75 variables from the original 563: the subject id ("subject"); the activity label ("activity"); and the 73 variables relating to the mean and standard deviation of the measurements. 
* Taking the means of the 10,299 observations for each of the 73 quantitative variables, resulting in 180 observations (the means for 30 subjects across 6 activities). 
* The final output is a data set consisting of 75 variables and 180 observations.


##License

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
