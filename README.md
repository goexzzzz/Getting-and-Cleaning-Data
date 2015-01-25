Getting and Cleaning Data
=========================

This is a repository that has code for the project to demonstrate ability to collect, work with, and clean a data set.</br>
(Course: Getting and Cleaning Data Coursera course through Johns Hopkins University.)


## Course Project
The main directory contains files run_analysis.R, CodeBook.md and README.md.</br>

* Unzip the data for the project (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder on your local drive. 

* In the 'UCI HAR Dataset' folder put the run_analysis.R 

* In the RStudio, set the working directory to the 'UCI HAR Dataset' folder by using the setwd command.

* Then run the source("run_analysis.R") to execute the R script to get the output data set(Average_Merged_Data_Set.txt) in the same 'UCI HAR Dataset' folder

* This data set contains data for 30 subjects and 6 activities. Each row represents the average of each variable for each activity and each subject. Thus the output data set contains 30 * 6 equal to 180 rows.