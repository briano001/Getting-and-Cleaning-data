
### Getting-and-Cleaning-data BackGround
#### Merges the training and the test sets to create one data set.
#### Extracts only the measurements on the mean and standard deviation for each measurement.
#### Uses descriptive activity names to name the activities in the data set
#### Appropriately labels the data set with descriptive variable names.
#### From the data set and creates a second, independent tidy data set with the average of each variable for each activity and each subject.


### How the script works
#### While the code is commented the script basically extracts the data from the different file categories, assigns them to variables, and then merges the data

### Download and unzip the file from the following URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### The following files should be present once extracted: features.txt, subject_train.txt, subject_test.txt, X_train.txt, X_test.txt, y_train.txt, y_test.txt

### The Readme.txt file within the downloaded zip file contains more detail on the content of the above files

### Dependencies
#### Should have reshape2 package present - R script will load it but it must be installed first

### Output
#### An independent data file called "indepdent_tidy_file.txt"

### Code Value Data (Taken from Readme file)
#### - 'features_info.txt': Shows information about the variables used on the feature vector.
#### - 'features.txt': List of all features.
#### - 'activity_labels.txt': Links the class labels with their activity name.
#### - 'train/X_train.txt': Training set.
#### - 'train/y_train.txt': Training labels.
#### - 'test/X_test.txt': Test set.
#### - 'test/y_test.txt': Test labels.

