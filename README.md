### We explain the run_analysis.R script for the Mentor Graded Assignment: Getting and Cleaning Data Course Project.

We used the dataset referenced in the following publication:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


Tasks are to
 1. Merge the training and the test sets to create one data set.
 2. Extract only the measurements on the mean and standard deviation for each measurement.
 3. Use descriptive activity names to name the activities in the data set
 4. Appropriately label the data set with descriptive variable names.
 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

In our script run_analysis.R,

`train_x` is a data frame of the measurements from “UCI/train/X_train.txt"

`train_y` stores the activity numbers from "UCI/train/Y_train.txt"

`train_subject` stores the subject numbers (1-30) from “UCI/train/subject_train.txt"

`features` stores the features list in "UCI/features.txt"


`mean_or_std` stores the features that compute mean or std

We then replace `train_x` with columns of `train_x` corresponding to features in `mean_or_std`

`activity_labels` stores the data in "UCI/activity_labels.txt"
 
`train` is the dataframe combining (via cbind) the data frames `train_subject`, `train_y`, `train_x`


`test_x` stores the data from "UCI/test/X_test.txt"

`test_y` stores the data from  "UCI/test/Y_test.txt"

`test_subject` stores the data from "UCI/test/subject_test.txt")


We then replace `test_x` with the columns of `test_x` that compute mean or std
`test_x<-test_x[, mean_or_std]`


we replace activity numbers in `test_y` with descriptive labels of activity 

`test` is the dataframe combining (via cbind) the dataframes `test_subject`, `test_y`, `test_x`

`all_data` is a dataframe of the row-bind of `train` and `test` dataframes

`grouped_all_data` is a data table grouping the data frame `all_data` by subject and activity

`grouped_means` computes the mean of each column of `grouped_all_data`

The file "grouped_means.txt" will be a tidy data set with the average of each variable for each activity and each subject.

