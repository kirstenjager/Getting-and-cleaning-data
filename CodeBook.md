# Table of contents

This codebook provides the following information:
1. Dataset description
2. Variable description
3. Transformations


# Dataset description
The data was collected from the [UCI Machine Learning Repository](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). This is a dataset on experiments that were carried out with a group of 30 people of 19-48 years of age. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing and laying) while wearing a smartwatch. The 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The dataset was partioned into two sets: 70% of the volunteers were selected for the training data and 30% for the test data.


# Variable description
The dataset contains a number of variables:

* subjectId: Person identifier, integer, ranges from 1 to 30
* activityType: Activity identifier, string, six possible values: walking, walking_upstairs, walking_downstairs, sitting, standing, laying
* activityId: Activity identifier, integer, ranges from 1 to 6 (corresponds to activityType)
* BodyAcc variables: mean and standard deviation of body acceleration in X, Y, Z directions
* GravityAcc variables: mean and standard deviation of gravity acceleration in X, Y, Z directions
* BodyAccJerk variables: mean and standard deviation of body acceleration jerk in X, Y, Z directions
* BodyGyro variables: mean and standard deviation of body angular velocity in X, Y, Z directions
* BodyGyroJerk variables: mean and standard deviation of body angular velocity jerk in X, Y, Z directions
* BodyAccMag variables: mean and standard deviation of body acceleration magnitude in X, Y, Z directions
* BodyAccJerkMag variables: mean and standard deviation of body acceleration jerk magnitude in X, Y, Z directions
* BodyGyroMag variables: mean and standard deviation of body angular velocity magnitude in X, Y, Z directions
* BodyGyroJerkMag variables: mean and standard deviation of body angular velocity jerk magnitude in X, Y, Z directions


# Transformations
The following transformations were applied to the dataset:
1. The training and test sets were merged into one dataset
2. Measurements on the mean and standard deviation variables were extracted
3. Based on the activity identifiers (1 to 6), the descriptive activity names were added
4. The variable names on means were changed from 'mean' to 'Mean' and on standard deviation from 'std' to 'StdDev'

All the transformations are captured in the run_analysis.R datascript.
