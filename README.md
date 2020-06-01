# Getting-and-cleaning-data
Course project of the Data science course: Getting and cleaning data

This assignment asks you to provide:
1) a tidy dataset
2) a link to a Github repository with your script for performing the analysis
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data 
4) a ReadMe file  

# Explanation of the files in this repository

## README.md
This file explains the different files in this repository and how they are connected. It furthermore provides the scripts.

## CodeBook.md
This CodeBook describes the variables, the data used and the transformations that have been performed to clean up the data.

## TidyDataset
This tidy dataset was produced by the script 'run_analysis.R' as described below. It contains the averages and standard deviations of a selection of variables from the dataset 'Human activity recognition using smartphones'.

## run_analysis.R
This is the main script in this repository. The variables are described in 'CodeBook.md'. The script performs the following tasks:

1. It checks whether a directory has been created. If not, it creates the directory. Furthermore, the dplyr package and the downloader package are loaded.
2. The dataset (zip file) is downloaded from the web.
3. The necessary training and test tables are read in.
4. Both the training and the testing data are combined into two separate tables.
5. The training and the testing observations are combined into one table.
6. Measurement data on mean and standard deviation is kept.
7. The activities are named and the labels are changed into descriptive names.
8. A new tidy dataset is created which captures the average of each variable for each activity and each subject
9. This newly created dataset is exported.
