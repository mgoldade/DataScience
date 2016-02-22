Labels1<-read.csv("features.csv",header=FALSE)

for (i in 1:nrow(Labels1)) {
  Step1<-as.matrix(str_trim(gsub("^[0-9][0-9]?[0-9]?","",str_trim(Labels1$V1))))
}

test_set<-read.csv("X_test.csv",header=FALSE)
train_set<-read.csv("X_train.csv",header=FALSE)
merge_data<-rbind(test_set,train_set)

colnames(merge_data)<-Step1[,1]

temp1<-merge_data[grep("mean\\()$",colnames(merge_data))]
temp2<-merge_data[grep("std\\()$",colnames(merge_data))]

Temp_Data<-cbind(temp1,temp2)

test_labels<-read.csv("y_test.csv",header=FALSE)
train_labels<-read.csv("y_train.csv",header=FALSE)
merge_labels<-rbind(test_labels,train_labels)

Trial_Data<-cbind(merge_labels,Temp_Data)
Trial_Data$V1<-gsub("1","Walking",Trial_Data$V1)
Trial_Data$V1<-gsub("2","Walking Upstairs",Trial_Data$V1)
Trial_Data$V1<-gsub("3","Walking Downstairs",Trial_Data$V1)
Trial_Data$V1<-gsub("4","Sitting",Trial_Data$V1)
Trial_Data$V1<-gsub("5","Standing",Trial_Data$V1)
Trial_Data$V1<-gsub("6","Laying",Trial_Data$V1)

colnames(Trial_Data)<-(c("Activity","TimeBodyAccelerationMagnitudeMean","TimeGravityAccelerationMagnitudeMean","TimeBodyAccelerationJerkMagnitudeMean","TimeBodyGyroscopeMagnitudeMean","TimeBodyGyroscopeJerkMagnitudeMean","FFTBodyAccelerationMagnitudeMean","FFTBodyBodyAccelerationJerkMagnitudeMean","FFTBodyBodyGyroscopeMagnitudeMean","FFTBodyBodyGyroscopeJerkMagnitudeMean","TimeBodyAccelerationMagnitudeStd","TimeGravityAccelerationMagnitudeStd","TimeBodyAccelerationJerkMagnitudeStd","TimeBodyGyroscopeMagnitudeStd","TimeBodyGyroscopeJerkMagnitudeStd","FFTBodyAccelerationMagnitudeStd","FFTBodyBodyAccelerationJerkMagnitudeStd","FFTBodyBodyGyroscopeMagnitudeStd","FFTBodyBodyGyroscopeJerkMagnitudeStd"))

Average_Data<-Trial_Data

Average_Data<-mutate(Average_Data,MeanofTimeBodyAccelerationMagnitudeMean=mean(TimeBodyAccelerationMagnitudeMean),
                     MeanofTimeGravityAccelerationMagnitudeMean=mean(TimeGravityAccelerationMagnitudeMean),MeanofTimeBodyAccelerationJerkMagnitudeMean=mean(TimeBodyAccelerationJerkMagnitudeMean),
                     MeanofTimeBodyGyroscopeMagnitudeMean=mean(TimeBodyGyroscopeMagnitudeMean),MeanofTimeBodyGyroscopeJerkMagnitudeMean=mean(TimeBodyGyroscopeJerkMagnitudeMean),
                     MeanofFFTBodyAccelerationMagnitudeMean=mean(FFTBodyAccelerationMagnitudeMean),MeanofFFTBodyBodyAccelerationJerkMagnitudeMean=mean(FFTBodyBodyAccelerationJerkMagnitudeMean),
                     MeanofFFTBodyBodyGyroscopeMagnitudeMean=mean(FFTBodyBodyGyroscopeMagnitudeMean),MeanofFFTBodyBodyGyroscopeJerkMagnitudeMean=mean(FFTBodyBodyGyroscopeJerkMagnitudeMean),
                     MeanofTimeBodyAccelerationMagnitudeStd=mean(TimeBodyAccelerationMagnitudeStd),MeanofTimeGravityAccelerationMagnitudeStd=mean(TimeGravityAccelerationMagnitudeStd),
                     MeanofTimeBodyAccelerationJerkMagnitudeStd=mean(TimeBodyAccelerationJerkMagnitudeStd),MeanofTimeBodyGyroscopeMagnitudeStd=mean(TimeBodyGyroscopeMagnitudeStd),
                     MeanofTimeBodyGyroscopeJerkMagnitudeStd=mean(TimeBodyGyroscopeJerkMagnitudeStd),MeanofFFTBodyAccelerationMagnitudeStd=mean(FFTBodyAccelerationMagnitudeStd),
                     MeanofFFTBodyBodyAccelerationJerkMagnitudeStd=mean(FFTBodyBodyAccelerationJerkMagnitudeStd),MeanofFFTBodyBodyGyroscopeMagnitudeStd=mean(FFTBodyBodyGyroscopeMagnitudeStd),
                     MeanofFFTBodyBodyGyroscopeJerkMagnitudeStd=mean(FFTBodyBodyGyroscopeJerkMagnitudeStd))

write.table(Average_Data,"Average_Data.txt",row.names=FALSE) 