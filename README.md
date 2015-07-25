Getting and Cleaning Data
=========================

The current repository contains pertinent materials for the "Getting and Cleaning Data" course.

## Course Project
* Data Set is used from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  (Collected from the assignment instruction)

* Meta data (data definition) of the Data set is explained in "Human Activity Recognition Using Smartphones Data Set" available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones (Collected from the assignment instruction)

* Create/choose a working directory that will be used in the R (or R Studio). The directory will contain the data and the source code ("run_analysis.R") available in the repo. The further documentation assumes that the working directory is "C:\Users\<<username>>\Documents\assignment", where <<username>> is username in your system. You can create, set the working directory, and confirm that the working directory name "assignment" directory from R Studio by dir.create("assignment"); setwd("assignment"); getwd()

* Download the zip file (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into the working directory. You can use eihter R Studio commands or use other ways such as use browser to download, save, and unzip the file in the working directory. R commands: download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", dest="dataset.zip"); unzip("dataset.zip")

* Change working directory to <<workding directory>>\UCI HAR Dataset. R commands: setwd("UCI HAR Dataset"); getwd()

* Place source file "run_analysis.R" in the working directory (C:\Users\username\Documents\assignment\UCI HAR Dataset\, already set in the above step). Source the code in R Studio by source("run_analysis.R")

* Outputs: (a)merged_clean_data.txt :- a tidy data set with all train and test data with proper labels (Subject and Activity) which contains only mean and standard deviations (10299 observations with 68 variables). (b)data_set_with_the_averages.txt : contains average of each variables for each activity and each subject (180 observations with 68 variables). (c) data_set_with_the_averages_rnf.txt :- same (b) without row names, this file is uploaded in the submission box as instructed in the assignment ("Please upload the tidy data set created in step 5 of the instructions. Please upload your data set as a txt file created with write.table() using row.name=FALSE (do not cut and paste a dataset directly into the text box, as this may cause errors saving your submission).") (d) validate the files are present by listing the files in the directory with command: list.files()

