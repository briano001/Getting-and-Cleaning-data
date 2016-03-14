
## Set working directory for where UCI diretory has been loaded - coomented out for sharing on github
## setwd("/Users/briano001/RSolutions/")


## Ensure all the proper libraries are loaded
require("data.table")
require(reshape2)

# Alternate to loading libraries
# library(data.table)
# library(reshape2)

# Load data from UCI files into variables
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features<- read.table("./UCI HAR Dataset/features.txt")[,2]
extractfeatures <- grepl("mean|std", features)
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

names(xtest) = features

xtest = xtest[,extractfeatures]

ytest[,2] = activitylabels[ytest[,1]]
names(ytest) = c("Activity_ID", "Activity_Label")
names(subjecttest) = "subject"
testdata <- cbind(as.data.table(subjecttest), ytest, xtest)

xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")

subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

names(xtrain) = features

## Extract mean and standard deviation data
xtrain = xtrain[,extractfeatures]

## Load and process activity data
ytrain[,2] = activitylabels[ytrain[,1]]
names(ytrain) = c("Activity_ID", "Activity_Label")
names(subjecttrain) = "subject"

traindata <- cbind(as.data.table(subjecttrain), ytrain, xtrain)

 # Merge the testing and training data
mergeddata = rbind(testdata, traindata)

## Appropriately labels the data set with Descriptive variable names
idlabels   = c("subject", "Activity_ID", "Activity_Label")
datalabels = setdiff(colnames(mergeddata), idlabels)
meltdata      = melt(mergeddata, id = idlabels, measure.vars = datalabels)

# Get the mean
independent_tidy_data= dcast(meltdata, subject + Activity_Label ~ variable, mean)

# Part 5 of assignment Write out the data to a text file 

write.table(independent_tidy_data, file = "./independent_tidy_file.txt", row.names=FALSE)
