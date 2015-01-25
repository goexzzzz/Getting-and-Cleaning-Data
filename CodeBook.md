Course Project Code Book
========================

The data referred in this project:</br>
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data is collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained: </br>
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


The R script (run_analysis.R) performs the following activities to clean up the data taken into consideration:

* Merge the train/X_train.txt with test/X_test.txt to produce a 10299x561 data frame("Number of Instances: 10299" and "Number of Attributes: 561"). Merge the train/y_train.txt with test/y_test.txt to produce a 10299x1 data frame with activity Ids. Merge the train/subject_train.txt with test/subject_test.txt to produce a 10299x1 data frame with subject Ids.

* Only the measurements on the mean and standard deviation for each measurement are extracted from the data frame. The complete list of measurments is given in features.txt. From the complete list of 561 attributes only 66 measurements are on mean and standard deviation. Thus the 10299x66 data frame is obtained by extracting only the data for 66 measurements from the 10299x561 data frame.

* Descriptive activity names are applied to the data set by reading the activity_labels.txt
. Activities Names are converted to lower case and underscores are removed from the names. The list of activities are:

        walking
        
        walkingupstairs
        
        walkingdownstairs
        
        sitting
        
        standing
        
        laying

* The script has descriptive variable names that clearly denote the data that the variables are holding. Then merge the previously obtained 10299x66 data frame with the ActivitiesNames and SubjectData such that the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements.

* The script creates a 2nd, independent tidy data set that has the average of each measurement for each activity and each subject. The final output is saved as Average_Merged_Data_Set.txt, a 180x68 data frame. The first column contains subject IDs, the second column contains Activity Names and then the averages for each of the 66 measurement attributes for each activity and each subject. There are 30 subjects and 6 activities, thus 180 rows in this data set with averages.