#create folder for storing, reading and writing data
if(!file.exists("./run_analysis")) {dir.create("./run_analysis")}

#get wd to restore to at the end of the procedure
wd <- getwd()

#set wd to the directory where data is saved
setwd("./run_analysis")

#download and unzip data. Store paths to files in filehandle
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","./temp",method="curl",quiet=TRUE)
filehandle <- unzip("./temp", exdir="./")

#load relevant files from filehandle
features <- read.table(filehandle[2],sep=" ", colClasses="character")
activity_labels <-read.table(filehandle[1],col.names=c("index","labels"))
testsubject <- read.table(filehandle[14],col.names='subject_name')
testx <- read.table(filehandle[15])
testy <- read.table(filehandle[16],col.names='activity_name')
trainsubject <- read.table(filehandle[26],col.names='subject_name')
trainx <- read.table(filehandle[27])
trainy <- read.table(filehandle[28],col.names='activity_name')

#renaming column names on test x and test y data with feature names, this is Step 4
library(data.table)
colnames(testx) <- features$V2
colnames(trainx) <- features$V2

#Consolidating & merging data, this is Step 1
totaltest <- cbind(testsubject, testy, testx)
totaltrain <- cbind(trainsubject, trainy, trainx)
totaldata <- rbind(totaltest,totaltrain)

#Extracting only the measures with mean and stdev, this is Step 2
extracteddata <-totaldata[,c(grepl("subject|activity|mean\\(\\)|std\\(\\)",colnames(totaldata),perl=TRUE))]

#Create a new variable called activity_name and assign descriptive names according to corresponding activity numbers, Step 3
extracteddata$activity_name<-factor(extracteddata$activity_name,activity_labels$index,activity_labels$labels)

#Creating tidy data set and saving to file, Step 5
tidydata <- aggregate(extracteddata[,3:ncol(extracteddata)],by=list(subject_name=extracteddata$subject_name,activity_name=extracteddata$activity_name),mean)
write.table(tidydata,file="tidydata.txt",sep=" ",row.names=FALSE)

#reset working directory
setwd(wd)