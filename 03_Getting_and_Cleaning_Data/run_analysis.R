#======================================================
# Data Processing R Script for Human Activity Recognition 
# Using Smartphones Dataset
# Version 1.0
# Authur: xinyi.sun
#======================================================

#readin feature list and activity lables data
features <- read.table("./UCI HAR Dataset/features.txt",stringsAsFactors=FALSE);
activities <- read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE);

#readin test files
testFeatureData <- read.table("./UCI HAR Dataset/test/x_test.txt");
testSubjectData <- read.table("./UCI HAR Dataset/test/subject_test.txt");
testActivityData <- read.table("./UCI HAR Dataset/test/y_test.txt");
testData <- cbind(testFeatureData,testSubjectData,testActivityData);

#readin training files
trainingFeatureData <- read.table("./UCI HAR Dataset/train/x_train.txt");
trainingSubjectData <- read.table("./UCI HAR Dataset/train/subject_train.txt");
trainingActivityData <- read.table("./UCI HAR Dataset/train/y_train.txt");
trainingData <- cbind(trainingFeatureData,trainingSubjectData,trainingActivityData);

#merge the training and test datasets
completeData <- rbind(testData,trainingData);
#assign colnames to each columns
colnames(completeData) <- c(features$V2,'Subject','Activity');

#merge the complete data set with acitivitys dataset 
#to assign each record its activity label
mergedData <- merge(completeData, activities, by.x='Activity', by.y='V1',all=TRUE)
colnames(mergedData)[length(colnames(mergedData))] <- 'ActivityLabel';

#extract mean and std data from the merged datasetstd
stdColNames <- grep(".*std\\(\\).*", colnames(mergedData), value = TRUE);
meanColNames <- grep(".*mean\\(\\).*", colnames(mergedData), value = TRUE)
extractData <- mergedData[,c(stdColNames,meanColNames,'Subject','ActivityLabel')]

#creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject
result <- ddply(extractData, .(Subject,ActivityLabel),colwise(mean))

#write the result into an output file
write.table(result,file="output.txt",row.name=FALSE)