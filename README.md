Course Project for Getting And Cleaning Data
Jennifer Stofer

This dataset is the result of analysis performed on the following
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

That data was originally obtained from 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The original data was first published by
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human
Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector
Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz,
Spain. Dec 2012.

The experiments were carried out with a group of 30 volunteers within an age bracket of 
19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
on the waist. The obtained dataset was randomly partitioned into two sets, where 70% of 
the volunteers was selected for generating the training data and 30% the test data. 

The following files from the original dataset were used in this analysis:
- 'features.txt': List of all the different observations.
- 'activity_labels.txt': Links the activity labels with their activity name.
- 'train/X_train.txt': Training set of observations.
- 'train/y_train.txt': Each row provides the activity label for the corresponding row in 
        the Training set. Its range is from 1-6.
- 'train/subject_train.txt: Each row identifies the subject who performed the activity for 
		each window sample. Its range is from 1 to 30.
- 'test/X_test.txt': Test set of observations.
- 'test/y_test.txt': Each row provides the activity label for the corresponding row in the
        test set. Its range is from 1 to 6.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for 
		each window sample. Its range is from 1 to 30.

The following transformations were performed on the data
1) Each of the files was read into a table
2) The training observations were combined with the activity and subject data into 1 table
3) The test observations were combined with the activity and subject data into 1 table
4) The test and training observations were then combined
5) The columns 'Subject' and 'Activity' were appended to the features table
6) The features table was used to provide the column names for the combined table
7) The activity labels were replaced with the descriptive activity names
8) All columns that were not mean or standard deviation measurements were removed
9) A new table was created with one row for each subject, activity pair - with the
   mean of each type of observation for that pair
10) The new table was written to a text file - SummaryData.txt

Thus the SummaryData contains 180 observations of 68 variables.
	30 Subjects * 6 Activities = 180
	66 calculated means for each pair, plus the Subject and Activity values
 