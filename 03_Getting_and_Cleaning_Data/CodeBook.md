The following is performed in the run_analysis.R to process the dataset.

1. readin feature list and activity lables data

   After downloading the dataset and extract it, readin the features.txt and activity_labels in the dataset folder as features and activities. 

2. readin test dataset and training dataset

   Readin test and training datasets. The following is load into R:
       
       * x_test.csv, y_test.csv, subject_test.csv
       * x_train.csv,y_train.csv, subject_train.csv

3. merge the training and test datasets 

   bind the x, y, subject dataset to form the full dataset for test and trainning dataset.

    And bind the test and trainning datasets to form the full datasets named mergedData.

4. assign colnames to each columns

use the features data to name the measures in the full datasets.


5. label the activity

merge the complete data set with acitivities dataset in order to assign each record its activity label

6. extract mean and std data from the merged dataset

extract the mean and standard deviation measures along with the Subject and Activily_Label into a new dataset named extractData. 


7. aggregate mean for all the measures of each subject, each activity
calculate the the average of each features in extractData for each activity and each subject and assign it to the result dataframe

8. write the result into an output file named output.csv

