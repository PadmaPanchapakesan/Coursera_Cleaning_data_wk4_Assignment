
Source Data
-------------
Data is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the data their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


R script
--------
R code "run_analysis.R" performs the following steps

1 Merges the training and the test sets to create one data set.
- Read Training data set
- Read Testing data set
- Read Features
- Read Activity labels
- Merge traing and test data

2 Appropriately labels the data set with descriptive variable names

3  Extracts only the measurements on the mean and standard deviation for each measurement

4. Uses descriptive activity names to name the activities in the data set

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

Variables
---------
x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
x_data, y_data and subject_data merge the previous datasets to further analysis.
features contains the correct names for the x_data dataset, which are applied to the column names stored in
