# Library reshape2 needed for melt/dcast functions
library(reshape2)

## The data is in the classic form used for machine learning. The
## features set X is a matrixi sored in X_train.txt, the result is a 
## "label" in file y_train.txt which is a vector with length equal 
## to the number of observations, i.e.  number of rows in X in this 
## case. There is also the subject_train.txt data which is also a 
## vector of length equal to the number of observations that I will
## include in the data set since the assignment requires it.

## Step 1 : Read the training and test data

# Read the training feature set
traindata <- read.table("train/X_train.txt",header = FALSE)

# Read the subject data. This is the people from whom the data was collected.
# Each subject is represented by a unique number
trainsubject <- read.table("train/subject_train.txt",header = FALSE)

# Read the training "label" data. This is the activity the subject was 
# performing at the time the data in the corresponding row was collected.
# This is the value that needs to be predicted by the machine learning
# algorithm.
trainlabel <- read.table("train/y_train.txt",header = FALSE)

# Combine the feature set, subject and activity
traindata <- cbind(traindata,trainsubject)
traindata <- cbind(traindata,trainlabel)

# Similarly, read and combine the data from the test directory
testdata <- read.table("test/X_test.txt",header = FALSE)
testsubject <- read.table("test/subject_test.txt",header = FALSE)
testlabel <- read.table("test/y_test.txt",header = FALSE)
testdata <- cbind(testdata,testsubject)
testdata <- cbind(testdata,testlabel)

# Combine training and test data
alldata <- rbind(traindata,testdata)

# Read the feature names from second column
allfeatures <- read.table("features.txt",header = FALSE, stringsAsFactors = FALSE)[,2]

# Add "subject" and "activity" to the feature names since we read in that data as well in the last
# two columns and name the columns in the data from the features names we collected
allfeatures <- as.character(c(allfeatures,"subject","activity"))

colnames(alldata) <- allfeatures

# Get the column indices for all the features that have "mean" or "std" in their names
wantedfeatures <- allfeatures[grep("mean.*\\(.*\\)|std.*\\(.*\\)|subject|activity", allfeatures,ignore.case = TRUE) ]

# Create new data set that only has the "mean" and "std" columns
wanteddata <- alldata[,c(wantedfeatures)]

# Change the column names to lowercase, the initial f is replaced by frequency, t 
# by time and so on. The () and - are removed 
names <- names(wanteddata)
names <- lapply(names, function(x) gsub("^f","freq",x))
names <- lapply(names, function(x) gsub("^t","time",x))
names <- lapply(names, function(x) tolower(x))
names <- lapply(names, function(x) gsub("[-()]", "",x))
names(wanteddata) <- names

# Read the table that can conver activity number to a name factor
activitynames <- read.table("activity_labels.txt",header = FALSE)

# Change activity numbers to name factors
wanteddata[,"activity"] <- factor(wanteddata[,"activity"], levels=activitynames[,1], labels = activitynames[,2])

# Melt all data in tall thin columns except for subject/activity columns
tidy.melted <- melt(wanteddata, id = c("subject", "activity"))

# Keep the subject/activity columns, expand the rest with only their means
tidy <- dcast(tidy.melted, subject + activity ~ variable  , mean)

# Write the tidy data set into the file "tidy.txt"
write.table(tidy,col.names = TRUE,file = "tidy.txt",row.names = FALSE, quote = FALSE)

