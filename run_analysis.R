## The data is in the classic form used for machine learning. The
## features set X is a matrixi sored in X_train.txt, the result is a 
## "label" in file y_train.txt which is a vector with length equal 
## to the number of observations, i.e.  number of rows in X in this 
## case. There is also the subject_train.txt data which is also a 
## vector of length equal to the number of observations that I will
## include in the data set since the assignment requires it.

## Step 1 : Read the training and test data

# Read the training feature set
traindf <- read.table("train/X_train.txt",header = FALSE)

# Read the subject data. This is the people from whom the data was collected.
# Each subject is represented by a unique number
trainsubject <- read.table("train/subject_train.txt",header = FALSE)

# Read the training "label" data. This is the activity the subject was 
# performing at the time the data in the corresponding row was collected.
# This is the value that needs to be predicted by the machine learning
# algorithm.
trainlabel <- read.table("train/y_train.txt",header = FALSE)

# Combine the feature set, subject and activity
traindf <- cbind(traindf,trainsubject)
traindf <- cbind(traindf,trainlabel)

# Similarly, read and combine the data from the test directory
testdf <- read.table("test/X_test.txt",header = FALSE)
testsubject <- read.table("test/subject_test.txt",header = FALSE)
testlabel <- read.table("test/y_test.txt",header = FALSE)
testdf <- cbind(testdf,testsubject)
testdf <- cbind(testdf,testlabel)

# Combine training and test data
alldata <- rbind(traindf,testdf)

# Read the feature names
features <- read.table("features.txt",header = FALSE, stringsAsFactors = FALSE)
# Add "subject" and "activity" to the feature names since we read in that data as well in the last
# two columns.
features <- rbind(features,data.frame(V1=(nrow(features)+1):(nrow(features) + 2),V2=c("subject","activity")))

# Name the columns in the data from the features names we collected
names(alldata) <- c(as.character(features$V2))

# Get the column indices fo all the features that have "mean" or "std" in their names
meanstdfeatures <- features[grep("mean.*\\(.*\\)|std.*\\(.*\\)|subject|activity", features$V2,ignore.case = TRUE), ]
# Create new data set that only has the "mean" and "std" columns
meanstddata <- alldata[,c(meanstdfeatures$V1)]

# Make the column names more meaningful by expanding the parts.
# The initial f is replaced by frequence, t by time and so on
names <- names(meanstddata)
names <- lapply(names, function(x) gsub("^f","frequency",x))
names <- lapply(names, function(x) gsub("^t","time",x))
names <- lapply(names, function(x) gsub("Body","body",x))
names <- lapply(names, function(x) gsub("Gyro","gyro",x))
names <- lapply(names, function(x) gsub("Jerk","jerk",x))
names <- lapply(names, function(x) gsub("Mag","magnitude",x))
names <- lapply(names, function(x) gsub("Acc","acceleration",x))
names <- lapply(names, function(x) gsub("Gravity","gravity",x))
names <- lapply(names, function(x) gsub("\\(|\\)","",x))
 names <- lapply(names, function(x) gsub("\\-","",x))
names(meanstddata) <- names

# Read the table that can conver activity number to a name string
activitynames <- read.table("activity_labels.txt",header = FALSE)

# For all the rows in the data set
for (k in 1:nrow(meanstddata)) {
 # Get the activity number
 actnum <- meanstddata[k,"activity"]
 # Convert number to activity name
 actname <- activitynames[[2]][[actnum]]
 # Create a new column with activity names instead of numbers
 meanstddata[k,"activityname"] <- actname
}
# Delete the activity column
meanstddata[,"activity"] <- NULL

tidy.melted <- melt(meanstddata, id = c("subject", "activityname"))
tidy <- dcast(tidy.melted, subject + activityname ~ variable  , mean)
write.table(tidy,col.names = TRUE,file = "tidy.txt")
