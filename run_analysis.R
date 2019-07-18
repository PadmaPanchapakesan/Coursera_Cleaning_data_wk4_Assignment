library(plyr)

setwd("D:\\Training\\Coursera\\DataCleaning\\Week4\\Dataset\\UCI HAR Dataset")
# 1. Merge the training and test datasets

#Read training data
x_train <- read.table("./train/X_train.txt", header = FALSE)
y_train <- read.table("./train/y_train.txt", header =FALSE)
subject_train <- read.table("./train/subject_train.txt", header = FALSE)

#Read test data
x_test <- read.table("./test/X_test.txt", header = FALSE)
y_test <- read.table("./test/y_test.txt", header = FALSE)
subject_test <- read.table("./test/subject_test.txt", header = FALSE)

#Read feature data
features <- read.table("features.txt", header = FALSE)

#Read activity labels
activityLabels = read.table("activity_labels.txt", header = FALSE)

# Assigning variable names
colnames(x_train) <- features[,2]
colnames(y_train) <- "activityID"
colnames(subject_train) <- "subjectID"

colnames(x_test) <- features[,2]
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"

colnames(activityLabels) <- c("activityID", "activityType")

#Merging training and data sets
alltrain <- cbind(y_train, subject_train, x_train)
alltest <- cbind(y_test, subject_test, x_test)
finaldataset <- rbind(alltrain, alltest)

# Extracting only the measurements on the mean and sd for each measurement

# Read column names
colNames <- colnames(finaldataset)

# Create vector for defining ID, mean, and sd
mean_and_std <- (grepl("activityID", colNames) |
                   grepl("subjectID", colNames) |
                   grepl("mean..", colNames) |
                   grepl("std...", colNames)
)

# Making subset
setforMeanandStd <- finaldataset[ , mean_and_std == TRUE]

# Use descriptive activity names
setWithActivityNames <- merge(setforMeanandStd, activityLabels,
                              by = "activityID",
                              all.x = TRUE)

# Label the data set with descriptive variable names
#Creating a second,  independent tidy data set with the avg of each variable for each activity and subject
tidySet <- aggregate(. ~subjectID + activityID, setWithActivityNames, mean)
tidySet <- tidySet[order(tidySet$subjectID, tidySet$activityID), ]

#Write second tidy data set into a txt file
write.table(tidySet, "tidySet.txt", row.names = FALSE)
