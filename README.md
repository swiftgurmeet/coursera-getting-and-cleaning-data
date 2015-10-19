## Getting and Cleaning Data Course Project

### Getting the data

This R code may be used to download and unzip the original data:

    filename <- "ucidata.zip"
    ## Get the dataset:
    if (!file.exists(filename)){
      fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(fileURL, filename, method="curl")
    }  
    if (!file.exists("UCI HAR Dataset")) { 
      unzip(filename) 
    }

### Generating the tidy data

The script `run_analysis.R` is then run on this data (original data) to generate a new set of data as required in the course project:

1.  Merge the training and the test sets to create one data set.
2.  Extract only the measurements on the mean and standard deviation for each measurement. 
3.  Descriptive activity names are used to name the activities in the data set
4.  Label the data set appropriately with descriptive variable names. 
5.  From the data set in step 4, a second, independent tidy data set is created with the mean of each feature variable for each activity and each subject. This is created in the file `tidy.txt`.

The R script file `run_analysis.R` contains comments describing its functionality. The script must be run in the directory containg the files "features.txt", "features_info.txt" etc. i.e. the "UCI HAR Dataset" directory.

### The Code Book
The file CodeBook.md contains the description of the data set in the file `tidy.txt`.
