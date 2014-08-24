The code has been explained block by block to cover key functionality

The first block of code creates the run_analysis folder and sets it as working directory. It then downloads the file from the provided web address and unzips it. If you have the file already you can comment this section out

```
if(!file.exists("./run_analysis")) 
{
		dir.create("./run_analysis")
}

wd <- getwd()
setwd("./run_analysis")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","./temp", method="curl",quiet=TRUE)
filehandle <- unzip("./temp", exdir="./")
```

Filehandle stores the path of all the files in lists in order. We can then refer to the relevant locations to read the files we will be working with and loading them into local variables. Columns have been recast,renamed where applicable
```
features <- read.table(filehandle[2],sep=" ", colClasses="character")
activity_labels <-read.table(filehandle[1],col.names=c("index","labels"))
testsubject <- read.table(filehandle[14],col.names='subject_name')
testx <- read.table(filehandle[15])
testy <- read.table(filehandle[16],col.names='activity_name')
trainsubject <- read.table(filehandle[26],col.names='subject_name')
trainx <- read.table(filehandle[27])
trainy <- read.table(filehandle[28],col.names='activity_name')
```

Giving meaningful names to to test and train data sets before merging them. Each variable name is represented by elements in the features table
```
library(data.table)
colnames(testx) <- features$V2
colnames(trainx) <- features$V2
```

Consolidating and merging data using cbind and rbind. The data is already clean so it is a simple matter of just adding rows and columns instead of element matching
```
totaltest <- cbind(testsubject, testy, testx)
totaltrain <- cbind(trainsubject, trainy, trainx)
totaldata <- rbind(totaltest,totaltrain)
```

Using grepl to extract only the subject and activity columns and only the columns containing mean() and std() data. meanfreq() has been considered out of scope for this exercise
```
extracteddata <-totaldata[,c(grepl("subject|activity|mean\\(\\)|std\\(\\)",colnames(totaldata),perl=TRUE))]
```
Replacing activity numbers 1-6 in activity_name column with corresponding meaningful activity  name
```
extracteddata$activity_name<-factor(extracteddata$activity_name,activity_labels$index,activity_labels$labels)
```

Creating tidy data set and saving to file
```
tidydata <- aggregate(extracteddata[,3:ncol(extracteddata)],by=list(subject_name=extracteddata$subject_name,activity_name=extracteddata$activity_name),mean)
write.table(tidydata,file="tidydata.txt",sep=" ",row.names=FALSE)
````

Reset working directory
```
setwd(wd)
```
