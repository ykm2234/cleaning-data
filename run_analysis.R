##This script is for the Mentor Graded Assignment: Getting and Cleaning Data Course Project.
## Tasks are to
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



## read in the data from train folder
train_x<-read.table("UCI/train/X_train.txt")
train_y<-read.table("UCI/train/Y_train.txt")
train_subject<-read.table("UCI/train/subject_train.txt")

##read in the features list
features<-read.table("UCI/features.txt")


names(train_x)<-features$V2      ##give descriptive names to columns of train_x
names(train_y)<-"activity"       ##give descriptive name to column of train_y
names(train_subject)<-"subject"  ##give descriptive name to column of train_subject

##find features that compute mean or std
mean_or_std<-grep("mean[()]|std[()]", features$V2, value=TRUE) 

##extract columns of train_x that compute mean or std
train_x<-train_x[, mean_or_std] 

##read in activity labels, and rename columns of corresponding data frame to be descriptive
activity_labels<-read.table("UCI/activity_labels.txt")
names(activity_labels)<-c("activity_number", "activity")

##make a function to use in sapply that will replace activity number with descriptive labels
replace_activity_number_with_words<-function(x) activity_labels$activity[x]

## replace activity numbers in train_y with descriptive labels of activity
train_y<-sapply(train_y, replace_activity_number_with_words)

## combine subject data, activity data, and numerical data into one data frame train
train<-cbind(train_subject, train_y, train_x) 


##next we repeat the above process for test dataset

##read in the data in the test folder 
test_x<-read.table("UCI/test/X_test.txt")
test_y<-read.table("UCI/test/Y_test.txt")
test_subject<-read.table("UCI/test/subject_test.txt")

##next three lines  give descriptive names to the columns of test_x, test_y, test_subject
names(test_x)<-features$V2
names(test_y)<-"activity"
names(test_subject)<-"subject"

##extract columns of test_x that compute mean or std
test_x<-test_x[, mean_or_std]


## replace activity numbers in test_y with descriptive labels of activity
test_y<-sapply(test_y, replace_activity_number_with_words)


test<-cbind(test_subject, test_y, test_x)

##combine train and test datasets into one data frame all_data
all_data<-rbind(train,test)  

library(dplyr)

##group data frame all_data by subject and activity
grouped_all_data<-group_by(all_data, subject, activity)  

##compute mean of each column of grouped_all_data
grouped_means<-summarize_each(grouped_all_data, funs(mean)) 

##write to a txt file the means grouped by subject and activity 
write.table(grouped_means, "grouped_means.txt")

## if you wish to read the data file we wrote, use the following command
recover_data<-read.table("grouped_means.txt")
