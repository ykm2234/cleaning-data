##CodeBook for "grouped_means.txt"

We began with the dataset referenced in the following publication:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
*Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine.* 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


We extracted only the measurements on the mean and standard deviation for each measurement in each of the training and test datasets.

We then combined the resulting training and test data. We used descriptive activity names to name the activities in the data set 
and labeled the data set with descriptive variable names, in particular 'subject' and `activity`

We then calculated the average of each variable for each activity and each subject, and wrote the output to a file

`subject` is a variable denoting a subject in the experiment, and takes values in 1-30

`activity` is a variable describing the activity the subject did, and takes values `WALKING`, `WALKING_UPSTAIRS`,
 `WALKING_DOWNSTAIRS`,  `SITTING`, `STANDING`,  `LAYING`.

The rest of this file contains information about the features and is copied verbatim from the file "features_info.txt" provided.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

`tBodyAcc-XYZ`

`tGravityAcc-XYZ`

`tBodyAccJerk-XYZ`

`tBodyGyro-XYZ`

`tBodyGyroJerk-XYZ`

`tBodyAccMag`

`tGravityAccMag`

`tBodyAccJerkMag`

`tBodyGyroMag`

`tBodyGyroJerkMag`

`fBodyAcc-XYZ`

`fBodyAccJerk-XYZ`

`fBodyGyro-XYZ`

`fBodyAccMag`

`fBodyAccJerkMag`

`fBodyGyroMag`

`fBodyGyroJerkMag`

The set of variables that were extracted from these signals are: 

`mean()`: Mean value

`std()`: Standard deviation



