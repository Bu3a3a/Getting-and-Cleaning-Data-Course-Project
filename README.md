#General information
This repo contains script required for Getting and Cleaning Data course Course Project 
called "run_analysis.R". 
Lets see how the script works and what it does step by step.

#Preparations
First part of the code I'd call "preparations". At this step my script checks status of
packages which will be used further (reshape2 and dplyr) and installs them if it's necessary. 
I also created here special variable containing path to your working directory where should 
be "UCI HAR Dataset" folder with files. 

#Reading and merging data
When everything is prepared, the script reads data from data sets using concatenated path
to your working directory and place of a data set in "UCI HAR Dataset" folder. Then:
1. It binds together parts of train and test data sets;
2. It merges train and test data sets together and saves result in mergedData variable. 

Note: If you don't have "UCI HAR Dataset" folder containing initial data files in your 
working directory it will cause an error.

#Renaming columns 
Now we have merged data with unnamed columns. To fix this my script reads "features.txt" file
in features variable, adds to it rows for "subject" and "activity" and then assigns 
these names to mergedData columns.

Note: If you don't have "UCI HAR Dataset" folder containing "features.txt" file in your 
working directory it will cause an error.

#Search for columns and extracting them in a new data set
Accordingly to Course Project assignment we need to extract columns associated with mean and
standard deviation. My code does it using grepl function by this scheme:
1. Creates logical variable meanVars indicating whether a column's associated with mean;
2. Creates logical variable stdVars indicating whether a column's associated with std;
3. Creates logical variable allVars indicating whether a column's associated with mean or 
std;
4. Makes last two values of allVars TRUE to include in result "subject" and "activity";
5. Extracts in extractedData all columns of mergedData where allVars is TRUE.

#Changing "activity" values 
At this step my code changes class of values in "activity" column to factor, reads 
"activity_labels.txt" in activity_labels variable and assign to levels of "activity" column
values from activity_labels variable.

Note: If you don't have "UCI HAR Dataset" folder containing "activity_labels.txt" file in your 
working directory it will cause an error.

#Extending column names 
Fourth part of task says to appropriately label the data set with descriptive variable names.
I think it means that script should extend names from abbreviations. My implementation uses
"for loop" for it. At each cycle (while the end of names(extractedData) is not reached) my
script looks in current name from names of extractedData for some abbreviations and 
replaces them with extended versions. There is list of them:
* t            time
* f            frequency
* Acc          Accelerometer
* Gyro         Gyroscope
* Mag          Magnitude
* -mean()      Mean
* -std()       StandardDeviation
* -X           AlongX
* -Y           AlongY
* -Z           AlongZ
* BodyBody     Body

Note: I used camelCase style for extended column names because it makes them more readable.
I know, that it violates some rules from lectures but I suppose that in this particular case
readability is the primary goal.

#Creating tidy data set with means
Last part of task is to create independent tidy data set with the average of each variable for 
each activity and each subject. The script does it using melt function and then dcast with
mean function.
When the script finishes its work there is tidy data set printed. It is also contained in
tidyData variable so you can use it as you wish.