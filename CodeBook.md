## Code Book for the Course Project

### The data set is contained in the file tidy.txt.

1. The field `subject` denotes the subject that performed an activity represented by a unique number. There are  a total of 30 subjects.
2. The second field `activity` denotes the activity performed by the subject. There are six types of activites here:

*   WALKING
*   WALKING_UPSTAIRS
*   WALKING_DOWNSTAIRS
*   SITTING
*   STANDING
*   LAYING

Rest of the fields are means of a subset of data (features) collected from the original dataset for each subject and activity. The fields starting with `time` and `freq` have units of time and frequency respectively. 

## Transformation of the original data

1. The training and test data are merged
2. The subject and activity labels for each set of observations is included in the combined data set
3. Only the fields containing `mean` or `std` in the base name were retained. 
4. The column names correspond to the name of the original measurement feature, simplified by converting to lower case, removing dashes and brackets and changing the prefixes `t` and `f` to `time` and `frequency` respectively. 
5. The values for each subject and activity are the means of the measurements named in the header of that column.  
6. The original dataset and its description are found at:[ UCI HAR Dataset ](http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions " UCI HAR Dataset ")

These are the names of the columns in the file tidy.txt
*   subject 
*   activity 
*   timebodyaccmeanx
*   timebodyaccmeany
*   timebodyaccmeanz
*   timebodyaccstdx
*   timebodyaccstdy
*   timebodyaccstdz
*   timegravityaccmeanx
*   timegravityaccmeany
*   timegravityaccmeanz
*   timegravityaccstdx
*   timegravityaccstdy
*   timegravityaccstdz
*   timebodyaccjerkmeanx
*   timebodyaccjerkmeany
*   timebodyaccjerkmeanz
*   timebodyaccjerkstdx
*   timebodyaccjerkstdy
*   timebodyaccjerkstdz
*   timebodygyromeanx
*   timebodygyromeany
*   timebodygyromeanz
*   timebodygyrostdx
*   timebodygyrostdy
*   timebodygyrostdz
*   timebodygyrojerkmeanx
*   timebodygyrojerkmeany
*   timebodygyrojerkmeanz
*   timebodygyrojerkstdx
*   timebodygyrojerkstdy
*   timebodygyrojerkstdz
*   timebodyaccmagmean
*   timebodyaccmagstd
*   timegravityaccmagmean
*   timegravityaccmagstd
*   timebodyaccjerkmagmean
*   timebodyaccjerkmagstd
*   timebodygyromagmean
*   timebodygyromagstd
*   timebodygyrojerkmagmean
*   timebodygyrojerkmagstd
*   freqbodyaccmeanx
*   freqbodyaccmeany
*   freqbodyaccmeanz
*   freqbodyaccstdx
*   freqbodyaccstdy
*   freqbodyaccstdz
*   freqbodyaccmeanfreqx
*   freqbodyaccmeanfreqy
*   freqbodyaccmeanfreqz
*   freqbodyaccjerkmeanx
*   freqbodyaccjerkmeany
*   freqbodyaccjerkmeanz
*   freqbodyaccjerkstdx
*   freqbodyaccjerkstdy
*   freqbodyaccjerkstdz
*   freqbodyaccjerkmeanfreqx
*   freqbodyaccjerkmeanfreqy
*   freqbodyaccjerkmeanfreqz
*   freqbodygyromeanx
*   freqbodygyromeany
*   freqbodygyromeanz
*   freqbodygyrostdx
*   freqbodygyrostdy
*   freqbodygyrostdz
*   freqbodygyromeanfreqx
*   freqbodygyromeanfreqy
*   freqbodygyromeanfreqz
*   freqbodyaccmagmean
*   freqbodyaccmagstd
*   freqbodyaccmagmeanfreq
*   freqbodybodyaccjerkmagmean
*   freqbodybodyaccjerkmagstd
*   freqbodybodyaccjerkmagmeanfreq
*   freqbodybodygyromagmean
*   freqbodybodygyromagstd
*   freqbodybodygyromagmeanfreq
*   freqbodybodygyrojerkmagmean
*   freqbodybodygyrojerkmagstd
*   freqbodybodygyrojerkmagmeanfreq
