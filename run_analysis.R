#Preparations
if ("reshape2" %in% rownames(installed.packages()) == FALSE) {
        install.packages("reshape2")
}
if ("dplyr" %in% rownames(installed.packages()) == FALSE) {
        install.packages("dplyr")
}
library(reshape2)
library(dplyr)
path <- getwd()


#Reads train data set
x_train <- read.table(paste(path, "/UCI HAR Dataset/train/X_train.txt", 
                            sep = ""),
                      header = FALSE)
subject_train <- read.table(paste(path, 
                                  "/UCI HAR Dataset/train/subject_train.txt", 
                                  sep = ""),
                            header = FALSE)
y_train <- read.table(paste(path, "/UCI HAR Dataset/train/y_train.txt", 
                            sep = ""),
                      header = FALSE)
names(subject_train) <- "subject"
names(y_train) <- "activity"
train <- cbind(x_train, subject_train, y_train)


#Reads test data set
x_test <- read.table(paste(path, "/UCI HAR Dataset/test/X_test.txt", 
                           sep = ""),
                     header = FALSE)
subject_test <- read.table(paste(path, "/UCI HAR Dataset/test/subject_test.txt", 
                                 sep = ""), 
                           header = FALSE)
y_test <- read.table(paste(path, "/UCI HAR Dataset/test/y_test.txt", 
                           sep = ""),
                     header = FALSE)
names(subject_test) <- "subject"
names(y_test) <- "activity"
test <- cbind(x_test, subject_test, y_test)


#Merges train and test data sets together
mergedData <- merge(train, test, all = TRUE)


#Reads variable names and renames accordingly columns of mergedData
features <- read.table(paste(path, "/UCI HAR Dataset/features.txt", 
                             sep = ""),
                       header = FALSE)
df <- data.frame(V1 = c(length(features[,1]) + 1, 
                              length(features[,1]) + 2), 
                       V2 = c("subject", "activity"))
feautersPlus <- rbind(features, df)                  #Adds subject and activity
colnames(mergedData) <- feautersPlus$V2


#Finds needed variables and extracts them in a new data set
meanVars <- grepl("mean()", feautersPlus$V2, fixed = TRUE)
stdVars <- grepl("std()", feautersPlus$V2, fixed = TRUE)
allVars <- meanVars | stdVars
allVars[(length(allVars)-1):length(allVars)] <- TRUE #Adds subject and activity
extractedData <- mergedData[,allVars]


#Changes activity class to factor and renames its levels
activity_labels <- read.table(paste(path, 
                                    "/UCI HAR Dataset/activity_labels.txt",
                                    sep = ""),
                       header = FALSE)
extractedData$activity <- as.factor(extractedData$activity)
levels(extractedData$activity) <- activity_labels[,2]


#Extends column (variable) names 
changed_names <- names(extractedData)
counter <- 1
for (name in names(extractedData)) {
        changed_names[counter] <- gsub("^t", "time", name)
        changed_names[counter] <- gsub("^f", "frequency", changed_names[counter])
        changed_names[counter] <- gsub("Acc", "Accelerometer", changed_names[counter], 
                                       fixed = TRUE)
        changed_names[counter] <- gsub("Gyro", "Gyroscope", changed_names[counter], 
                                       fixed = TRUE)
        changed_names[counter] <- gsub("Mag", "Magnitude", changed_names[counter], 
                                       fixed = TRUE)
        changed_names[counter] <- gsub("BodyBody", "Body", changed_names[counter], 
                                       fixed = TRUE)
        changed_names[counter] <- gsub("-mean()", "Mean", changed_names[counter], 
                                       fixed = TRUE)
        changed_names[counter] <- gsub("-std()", "StandardDeviation", changed_names[counter], 
                                       fixed = TRUE)
        changed_names[counter] <- gsub("-X", "AlongX", changed_names[counter], 
                                       fixed = TRUE)
        changed_names[counter] <- gsub("-Y", "AlongY", changed_names[counter], 
                                       fixed = TRUE)
        changed_names[counter] <- gsub("-Z", "AlongZ", changed_names[counter], 
                                       fixed = TRUE) 
        counter <- counter + 1
}
names(extractedData) <- changed_names


#Creates a new independent tidy data set with the average of each variable 
#for each activity and each subject
moltenData <- melt(extractedData, id.vars = c("subject", "activity"))
tidyData <- dcast(subject + activity ~ variable, data = moltenData, fun = mean)


#Shows tidy data to a user
tidyData