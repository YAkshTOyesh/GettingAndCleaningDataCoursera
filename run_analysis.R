#Downloading file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./DataToBeCleaned.zip")

#Unzipping file
path_dataset <- "C:\\Users\\20020253\\Documents\\datasciencecoursera\\DataToBeCleaned.zip"
unzip(path_dataset)
getwd()

#Reading data files 
path_dataset_test <- "C:\\Users\\20020253\\Documents\\datasciencecoursera\\UCI HAR Dataset\\test"
setwd(path_dataset_test)
subject_test <- read.table("subject_test.txt")
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")

path_dataset_train <- "C:\\Users\\20020253\\Documents\\datasciencecoursera\\UCI HAR Dataset\\train"
setwd(path_dataset_train)
subject_train <- read.table("subject_train.txt")
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")

#Merging data
train_data <- cbind(subject_train, y_train, X_train)
test_data <- cbind(subject_test, y_test, X_test)
merged_data <- rbind(test_data, train_data) 

#Extracting mean and std
path_dataset_subject <- "C:\\Users\\20020253\\Documents\\datasciencecoursera\\UCI HAR Dataset"
setwd(path_dataset_subject)
features <- read.table("features.txt")
extract_columns <- 2 + grep("mean()|std()", features$V2)
extract_mean_and_std <- merged_data[,extract_columns]

#Creating descriptive names for activity labels
activities <- read.table("activity_labels.txt")
activities_names <- activities$V2

#Creating descriptive names for data labels
features$V2 <- sub("t","time",features$V2)
features$V2 <- sub("f", "freq", features$V2)
new_names <- c("SubjectID", "ActivityLabels", features$V2)
colnames(merged_data) <- new_names

#Ensuring all names are unique
colnames(merged_data) <- make.names(colnames(merged_data), unique = TRUE)

#Creating a second, independent tidy data set with the average of each variable for each activity and each subject.
final_tidy_data <- merged_data %>% tbl_df() %>% group_by(SubjectID, ActivityLabels)%>% summarise_each(mean)

#Creating text file
write.table(final_tidy_data, file = "./Tidy_set_for_step_5.txt", row.names = FALSE)

colnames(merged_data)
