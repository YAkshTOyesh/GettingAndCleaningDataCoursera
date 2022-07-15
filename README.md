# GettingAndCleaningDataCoursera
Project for Coursera Getting and cleaning data
The run_analysis.R file does the following in this onrder of stepl:
1. Download dataset
2. Unizip file
3. Download the different data: X_test, y_test, subject_test, X_train, y_train, subject_train
4. Merges data to for two new data sets: test_data (contain X_test, y_test, subject_test) and train_data(contains X_train, y_train and subject_train)
5. Merges test_data and train data to form merged data
6. Extracts mean and standard deviation as per instruction: creates a string search vector snd uses grep to extract columns 
7. Creates activity labels usinfg sub() function
8. Creates descriptive names using sub() function
9. Duplicates names were found during testing process. Hence make.names(unique = TRUE) is used to solve this issue: for duplicate names a version is added such as x.1, x.2 (where x is the duplicate name)
10. Creates second tidy data set as per instructions
11. Creates text file as per instructions 
