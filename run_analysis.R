Labels1<-read.csv("features.csv",header=FALSE)

for (i in 1:nrow(Labels1)) {
  Step1<-as.matrix(str_trim(gsub("^[0-9][0-9]?[0-9]?","",str_trim(Labels1$V1))))
}
library(stringr)
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

colnames(Trial_Data)<-(c("Activity","TimeBodyAccelerationMagnitudeMean",
                                    "TimeGravityAccelerationMagnitudeMean",
                                    "TimeBodyAccelerationJerkMagnitudeMean",
                                    "TimeBodyAngularVelocityMagnitudeMean",
                                    "TimeBodyAngularVelocityJerkMagnitudeMean",
                                    "FreqBodyAccelerationMagnitudeMean",
                                    "FreqBodyAccelerationJerkMagnitudeMean",
                                    "FreqBodyAngularVelocityMagnitudeMean",
                                    "FreqBodyAngularVelocityJerkMagnitudeMean",
                                    "TimeBodyAccelerationMagnitudeStd",
                                    "TimeGravityAccelerationMagnitudeStd",
                                    "TimeBodyAccelerationJerkMagnitudeStd",
                                    "TimeBodyAngularVelocityMagnitudeStd",
                                    "TimeBodyAngularVelocityJerkMagnitudeStd",
                                    "FreqBodyAccelerationMagnitudeStd",
                                    "FreqBodyAccelerationJerkMagnitudeStd",
                                    "FreqBodyAngularVelocityMagnitudeStd",
                                    "FreqBodyAngularVelocityJerkMagnitudeStd"))

Average_Data<-Trial_Data

library(dplyr)
Average_Data<-mutate(Average_Data,MeanofTimeBodyAccelerationMagnitudeMean=mean(TimeBodyAccelerationMagnitudeMean),
                     MeanofTimeGravityAccelerationMagnitudeMean=mean(TimeGravityAccelerationMagnitudeMean),MeanofTimeBodyAccelerationJerkMagnitudeMean=mean(TimeBodyAccelerationJerkMagnitudeMean),
                     MeanofTimeBodyAngularVelocityMagnitudeMean=mean(TimeBodyAngularVelocityMagnitudeMean),MeanofTimeBodyAngularVelocityJerkMagnitudeMean=mean(TimeBodyAngularVelocityJerkMagnitudeMean),
                     MeanofFreqBodyAccelerationMagnitudeMean=mean(FreqBodyAccelerationMagnitudeMean),MeanofFreqBodyAccelerationJerkMagnitudeMean=mean(FreqBodyAccelerationJerkMagnitudeMean),
                     MeanofFreqBodyAngularVelocityMagnitudeMean=mean(FreqBodyAngularVelocityMagnitudeMean),MeanofFreqBodyAngularVelocityJerkMagnitudeMean=mean(FreqBodyAngularVelocityJerkMagnitudeMean),
                     MeanofTimeBodyAccelerationMagnitudeStd=mean(TimeBodyAccelerationMagnitudeStd),MeanofTimeGravityAccelerationMagnitudeStd=mean(TimeGravityAccelerationMagnitudeStd),
                     MeanofTimeBodyAccelerationJerkMagnitudeStd=mean(TimeBodyAccelerationJerkMagnitudeStd),MeanofTimeBodyAngularVelocityMagnitudeStd=mean(TimeBodyAngularVelocityMagnitudeStd),
                     MeanofTimeBodyAngularVelocityJerkMagnitudeStd=mean(TimeBodyAngularVelocityJerkMagnitudeStd),MeanofFreqBodyAccelerationMagnitudeStd=mean(FreqBodyAccelerationMagnitudeStd),
                     MeanofFreqBodyAccelerationJerkMagnitudeStd=mean(FreqBodyAccelerationJerkMagnitudeStd),MeanofFreqBodyAngularVelocityMagnitudeStd=mean(FreqBodyAngularVelocityMagnitudeStd),
                     MeanofFreqBodyAngularVelocityJerkMagnitudeStd=mean(FreqBodyAngularVelocityJerkMagnitudeStd))

write.table(Average_Data,"Average_Data.txt",row.names=FALSE) 