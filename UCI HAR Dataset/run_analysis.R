# Data Set is used from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Meta data (data definition) of the Data set is explained in "Human Activity Recognition Using Smartphones Data Set" available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


# This R script does the following:
# 1. Merges the training and the test sets to create one data set.
# merge train and test sets of X
x_train_ds <- read.table("train/X_train.txt")
x_test_ds <- read.table("test/X_test.txt")
x_train_test_ds <- rbind(x_train_ds, x_test_ds)
# merge train and test sets of subject
subject_train_ds <- read.table("train/subject_train.txt")
subject_test_ds <- read.table("test/subject_test.txt")
subject_train_test_ds <- rbind(subject_train_ds, subject_test_ds)
# merge train and test sets of y
y_train_ds <- read.table("train/y_train.txt")
y_test_ds <- read.table("test/y_test.txt")
y_train_test_ds <- rbind(y_train_ds, y_test_ds)


#2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")
# Friendly names to features column
names(features) <- c('feature_id', 'feature_name')
# Search for mean or standard deviation (sd); dont just look for "mean" because the result will yeild mean and meanFreq.
#Thus check "-mean ()" or "-std ()" {including hyphen, space and the braces}
index_features_mean_std <- grep("-mean\\()|-std\\()", features$feature_name) 
#index_features <- grep("-mean\\(\\)|-std\\(\\)", features$feature_name) #this pattern and the above pattern gives the same results
x_train_test_ds <- x_train_test_ds[, index_features_mean_std] 
#collects names of all means and standard deviations
names_features_mean_std <- features[index_features_mean_std, 2]
# Replaces all matches of a string features 
#names(x_train_test_ds) <- gsub("\\(|\\)", "", (features[index_features_mean_std, 2]))
names(x_train_test_ds) <- gsub("\\(|\\)", "", names_features_mean_std)

#3.Uses descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")
#activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
y_train_test_ds[,1] = activities[y_train_test_ds[,1], 2]
names(y_train_test_ds) <- "Activity"

# 4.Appropriately labels the data set with descriptive activity names.
names(subject_train_test_ds) <- "Subject"
all_data <- cbind(subject_train_test_ds, y_train_test_ds, x_train_test_ds)
write.table(all_data, "merged_clean_data.txt")

#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
all_data_avg <- all_data[, 3:dim(all_data)[2]] 
all_data_avg_ds <- aggregate(all_data_avg,list(all_data$Subject, all_data$Activity), mean)
# Activity and Subject name of columns 
names(all_data_avg_ds)[1] <- "Subject"
names(all_data_avg_ds)[2] <- "Activity"# Created csv (tidy data set) in diretory
write.table(all_data_avg_ds, "data_set_with_the_averages.txt")
write.table(all_data_avg_ds, "data_set_with_the_averages_rnf.txt", row.name=FALSE)