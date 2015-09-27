runAnalysis<-function()
{
##1. Merges the training and the test sets to create one data set.
  #loading features  
  features<- read.table("Getting and Cleaning Data/UCI HAR Dataset/features.txt");

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
  features_mean_std<- grepl("mean|std", features$V2);
  
  #loading test sets of data
  subject_test<-read.table("Getting and Cleaning Data/UCI HAR Dataset/test/subject_test.txt");
  X_test<-read.table("Getting and Cleaning Data/UCI HAR Dataset/test/X_test.txt");
  Y_test<-read.table("Getting and Cleaning Data/UCI HAR Dataset/test/y_test.txt");
  
  #loading activity labels
  activity_labels<-read.table("Getting and Cleaning Data/UCI HAR Dataset/activity_labels.txt")[,2];

##4.Appropriately labels the data set with descriptive activity names.
  names(activity_labels)<-c("Activity_id","Activity_title");  
  
  #naming/building X_test dataset
  names(X_test)<-features$V2
  X_test<-X_test[,features_mean_std]
  
  #naming/building Y_test dataset
  Y_test[,2]<- activity_labels[Y_test[,1]]
  names(Y_test)<-c("Activity_id","Activity_label")
  
  #naming/building subject_test dataset
  names(subject_test)<-c("Subject")
  
  #merging test data set.
  test_data<- cbind(cbind(subject_test,Y_test), X_test)
  
  #loading training sets of data
  subject_training<-read.table("Getting and Cleaning Data/UCI HAR Dataset/train/subject_train.txt");
  X_training<-read.table("Getting and Cleaning Data/UCI HAR Dataset/train/X_train.txt");
  Y_training<-read.table("Getting and Cleaning Data/UCI HAR Dataset/train/y_train.txt");
  
  #naming/building X_training dataset
  names(X_training)<-features$V2
  X_training<-X_training[,features_mean_std]
  
  #naming/building Y_test dataset
  Y_training[,2]<- activity_labels[Y_training[,1]]
  
## 3. Uses descriptive activity names to name the activities in the data set
  names(Y_training)<-c("Activity_id","Activity_label")
  
  #naming/building subject_test dataset
  names(subject_training)<-c("Subject")
  
  #merging test data set.
  training_data<- cbind(cbind(subject_training,Y_training), X_training)
  
  #merging test data and training set of data.
  myFinalData<- rbind(test_data,training_data)
  
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  id_labels   = c("Subject", "Activity_id", "Activity_label")
  data_labels = setdiff(colnames(myFinalData), id_labels)
  melt_data<- melt(myFinalData, id = id_labels, measure.vars = data_labels)
  
  tidy_data   = dcast(melt_data, Subject + Activity_label ~ variable, mean)
  write.table(tidy_data,"Getting and Cleaning Data/TidyData.txt", row.names = F)
}