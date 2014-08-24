##Description of Input, Output, Transformations and Variables for run_analysis.R

####Summary
The script downoads Human Activity Recognition Using Smartphones Data Set from UCI Machine Learning Repository and ouputs a tidy data set according to the requirements specified.

####Problem Definition
Defined here: https://class.coursera.org/getdata-006/human_grading/view/courses/972584/assessments/3/submissions

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

####Acquiring Data Input
Data is programatically downloaded from the following location: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

Downloaded data set information as specified by the source

>Data Set Information:

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

>Check the README.txt file for further details about this dataset.

>Attribute Information:

>For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Downloaded dataset is unzipped to a file handle that contains paths for all the files in the dataset. The following files are available

1. UCI HAR Dataset/activity_labels.txt
2. UCI HAR Dataset/features.txt
3. UCI HAR Dataset/features_info.txt
4. UCI HAR Dataset/README.txt
5. UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt
6. UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt
7. UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt
8. UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt
9. UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt
10. UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt
11. UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt
12. UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt
13. UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt
14. UCI HAR Dataset/test/subject_test.txt
15. UCI HAR Dataset/test/X_test.txt
16. UCI HAR Dataset/test/y_test.txt
17. UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt
18. UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt
19. UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt
20. UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt
21. UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt
22. UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt
23. UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt
24. UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt
25. UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt
26. UCI HAR Dataset/train/subject_train.txt
27. UCI HAR Dataset/train/X_train.txt
28. UCI HAR Dataset/train/y_train.txt

As per the problem definition we will only use the following files:

1. UCI HAR Dataset/activity_labels.txt 
2. UCI HAR Dataset/features.txt
3. UCI HAR Dataset/README.txt
4. UCI HAR Dataset/test/subject_test.txt
5. UCI HAR Dataset/test/X_test.txt
6. UCI HAR Dataset/test/y_test.txt
7. UCI HAR Dataset/train/subject_train.txt
8. UCI HAR Dataset/train/X_train.txt
9. UCI HAR Dataset/train/y_train.txt

####Variable definitions by input file

**activity_labels.txt**

Matches descriptive activity names with activity numbers.

column 1: numeric activity numbers from 1 to 6

column 2: descriptive activity names corresponding to activity numbers: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

**features.txt**

Contains list of variables calculated using the data from Samsung Galaxy S II with corresponding indices. 561 features in total

column 1: numeric indices from 1 to 561

column 2: variable names 

**README.txt**

Details of the experiment conducted at the UCI, definiton of the data collected and structure of the data set that we have downloaded

**subject_test.txt**

test subject numbers corresponding to each observation (i.e. row) in X_test.txt

**X_test.txt**

data table with 561 columns, each column referring to variables as listed in order in features.txt. Test observations for each set of variables are in rows, each row has a corresponding entry in subject_test.txt and Y_test.txt

This is the one of the main data tables to be manipulated

**Y_test.txt**

activity numbers corresponding to each subject entry and each set of observations in X_test.txt. Together subject_test and X_test and Y_test work as follows:

* each row of subject_test lists subject number i.e. participant in the experiment
* each row of Y_test lists activity number (1 to 6) carried out by the subject in subject_test
* each row of X_test contains observations for 561 variables measured on the corresponding activity on Y_test carried out by subject_test

**subject_train.txt**

Identical to subject_test but in training data space instead of test data space

**X_train.txt**

Identical to X_test but in training data space instead of test data space

**Y_train.txt**

Identical to Y_test but in training data space instead of test data space

####Merging and Consolidating Data

Since both test and train data sets are identically structured we use row and column binding to merge the data sets:

1. Variable names from features.txt are set as column names in X_test.txt and X_train.txt
2. subject_test and Y_test are added as columns to X_test
3. subject_train and Y_train are added as columns to X_train
4. Data sets from steps 2 and 3 are combined by adding rows
5. The consolidated data set from step 4 is written out to totaldata.txt in the working directory

####Making Tidy Data

1. We use regular expressions to only pick up the following columns from the consolidated data:

  * activity numbers
  * subject numbers
  * all variables containing mean() and stdev() measures. All other columns are dropped

Total: 68 columns

2. Activity numbers are replaced with corresponding activity names from activity_labels.txt

3. Observations (rows) are grouped on subject number and activity name by mean.

4. Tidy data is written out to tidydata.txt in the working directory

####Details of Variables in Tidy Data

1. subject_name: numeric data from 1 to 30 representing 30 participants in the experiment
2. activity_name: character data for the six activities as listed above	

Values of variables 3 to 68 are normalized in the range [-1,1]

3. tBodyAcc-mean()-X: Mean of body linear acceleration in X axis in time domain
4. tBodyAcc-mean()-Y: Mean of body linear acceleration in Y axis in time domain
5. tBodyAcc-mean()-Z: Mean of body linear acceleration in Z axis in time domain
6. tBodyAcc-std()-X: Stdev of body linear accelerative in X axis in time domain
7. tBodyAcc-std()-Y: Stdev of body linear accelerative in Y axis in time domain
8. tBodyAcc-std()-Z: Stdev of body linear accelerative in Z axis in time domain
9. tGravityAcc-mean()-X: Mean of gravity linear acceleration in X axis in time domain	
10. tGravityAcc-mean()-Y: Mean of gravity linear acceleration in Y axis in time domain  	
11. tGravityAcc-mean()-Z: Mean of gravity linear acceleration in Z axis in time domain  	
12. tGravityAcc-std()-X: Stdev of gravity linear acceleration in X axis in time domain  	
13. tGravityAcc-std()-Y: Stdev of gravity linear acceleration in Y axis in time domain  	
14. tGravityAcc-std()-Z: Stdev of gravity linear acceleration in Z axis in time domain  	
15. tBodyAccJerk-mean()-X: Mean of body linear jerk in X axis in time domain	
16. tBodyAccJerk-mean()-Y: Mean of body linear jerk in Y axis in time domain  	
17. tBodyAccJerk-mean()-Z: Mean of body linear jerk in Z axis in time domain  
18. tBodyAccJerk-std()-X: Stdev of body linear jerk in X axis in time domain  	
19. tBodyAccJerk-std()-Y: Stdev of body linear jerk in Y axis in time domain  	
20. tBodyAccJerk-std()-Z: Stdev of body linear jerk in Z axis in time domain  	
21. tBodyGyro-mean()-X: Mean of body angular acceleration in X axis in time domain
22. tBodyGyro-mean()-Y: Mean of body angular acceleration in Y axis in time domain	
23. tBodyGyro-mean()-Z: Mean of body angular acceleration in Z axis in time domain	
24. tBodyGyro-std()-X: Stdev of body angular acceleration in X axis in time domain	
25. tBodyGyro-std()-Y: Stdev of body angular acceleration in Y axis in time domain	
26. tBodyGyro-std()-Z: Stdev of body angular acceleration in Z axis in time domain	
27. tBodyGyroJerk-mean()-X: Mean of body angular jerk in X axis in time domain	
28. tBodyGyroJerk-mean()-Y: Mean of body angular jerk in Y axis in time domain	
29. tBodyGyroJerk-mean()-Z: Mean of body angular jerk in Z axis in time domain	
30. tBodyGyroJerk-std()-X: Stdev of body angular jerk in X axis in time domain	
31. tBodyGyroJerk-std()-Y: Stdev of body angular jerk in Y axis in time domain	
32. tBodyGyroJerk-std()-Z: Stdev of body angular jerk in Z axis in time domain	
33. tBodyAccMag-mean(): Mean of body linear acceleration magnitude in time domain	
34. tBodyAccMag-std(): Stdev of body linear acceleration magnitude in time domain	
35. tGravityAccMag-mean(): Mean of gravity linear acceleration magnitude in time domain	
36. tGravityAccMag-std(): Stdev of gravity linear acceleration magnitude in time domain	
37. tBodyAccJerkMag-mean(): Mean of body jerk magnitude in time domain	
38. tBodyAccJerkMag-std(): Stdev of body jerk magnitude in time domain	
39. tBodyGyroMag-mean(): Mean of body angular acceleration magnitude in time domain	
40. tBodyGyroMag-std(): Stdev of body angular acceleration magnitude in time domain	
41. tBodyGyroJerkMag-mean(): Mean of body angular jerk magnitude in time domain	
42. tBodyGyroJerkMag-std(): Stdev of body angular jerk magnitude in time domain	
43. fBodyAcc-mean()-X: Mean of body linear acceleration in X axis in frequency domain	
44. fBodyAcc-mean()-Y: Mean of body linear acceleration in Y axis in frequency domain  	
45. fBodyAcc-mean()-Z: Mean of body linear acceleration in Z axis in frequency domain  	
46. fBodyAcc-std()-X: Stdev of body linear acceleration in X axis in frequency domain  	
47. fBodyAcc-std()-Y: Stdev of body linear acceleration in Y axis in frequency domain  	
48. fBodyAcc-std()-Z: Stdev of body linear acceleration in Z axis in frequency domain  	
49. fBodyAccJerk-mean()-X: Mean of body linear jerk in X axis in frequency domain	
50. fBodyAccJerk-mean()-Y: Mean of body linear jerk in Y axis in frequency domain	
51. fBodyAccJerk-mean()-Z: Mean of body linear jerk in Z axis in frequency domain	
52. fBodyAccJerk-std()-X: Stdev of body linear jerk in X axis in frequency domain	
53. fBodyAccJerk-std()-Y: Stdev of body linear jerk in Y axis in frequency domain	
54. fBodyAccJerk-std()-Z: Stdev of body linear jerk in Z axis in frequency domain	
55. fBodyGyro-mean()-X: Mean of body angular acceleration in X axis in frequency domain	
56. fBodyGyro-mean()-Y: Mean of body angular acceleration in Y axis in frequency domain  	
57. fBodyGyro-mean()-Z: Mean of body angular acceleration in Z axis in frequency domain  	
58. fBodyGyro-std()-X: Stdev of body angular acceleration in X axis in frequency domain  	
59. fBodyGyro-std()-Y: Stdev of body angular acceleration in Y axis in frequency domain  	
60. fBodyGyro-std()-Z: Stdev of body angular acceleration in Z axis in frequency domain  	
61. fBodyAccMag-mean(): Mean of body linear acceleration magnitude in frequency domain	
62. fBodyAccMag-std(): Stdev of body linear acceleration magnitude in frequency domain	
63. fBodyBodyAccJerkMag-mean(): Mean of body jerk magnitude in frequency domain	
64. fBodyBodyAccJerkMag-std(): Stdev of body jerk magnitude in frequency domain	
65. fBodyBodyGyroMag-mean(): Mean of body angular acceleration magnitude in frequency domain	
66. fBodyBodyGyroMag-std(): Stdev of body angular acceleration magnitude in frequency domain	
67. fBodyBodyGyroJerkMag-mean(): Mean of body angular jerk magnitude in frequency domain	
68. fBodyBodyGyroJerkMag-std(): Stdev of body angular jerk magnitude in frequency domain

####ReadME.MD
Refer to README.MD in the github repository for details on code functionality