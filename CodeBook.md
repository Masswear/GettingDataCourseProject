==================================================================
Course Project: Getting and Cleaning Data [Link to Course on Coursera.org](class.coursera.org/getdata-011)
==================================================================
by Masswear
==================================================================

#Data

The script produces the following dataframes:

- *'fulldata':* contains the measurements on the mean and standard deviation of the merged test and training data along with the subject and the activity performed
- *'summarise':* contains the average of each measurement grouped by subject and activity (wide form)
- *'tidydata':* tall form of 'summarise'

#Variables

The 'fulldata' dataframe contains the following variables:

- *V1 = subject:* ID of subject performing the activity (integer)
- *V2 = activity:* activity performed (factor; for levels and labels refer to 'activity_labels.txt' from source data).
- *V3-V68:* the measurements on the mean and standard deviation of the merged test and training data (numeric). For descriptions of variables refer to 'features_info.txt' from source data)

The 'summarise' dataframe contains the following variables:

- *V1 = subject:* ID of subject performing the activity (integer)
- *V2 = activity:* activity performed (factor; for levels and labels refer to 'activity_labels.txt' from source data)
- *V3-V68: average* of each measurement on the mean and standard deviation grouped by subject and activity (numeric). For descriptions of variables refer to 'features_info.txt' from source data)

The 'tidydata' dataframe contains the following variables:

- *V1 = subject:* ID of subject performing the activity (integer)
- *V2 = activity:* activity performed (factor; for levels and labels refer to 'activity_labels.txt' from source data)
- *V3 = feature:* feature measured (factor; for levels and labels refer to 'features.txt' from source data. For descriptions of labels refer to 'features_info.txt' from source data))
- *V4 = value:* average of each measurement on the mean and standard deviation grouped by subject and activity (numeric)

#Transformations

The following transformations are applied to the source data:

- combine smartphone data from 'X_train.txt' and 'X_test.txt' 
- assign features from 'features.txt' as variable names to test and train data
- extract columns with measurements of mean and standard deviation from smartphone data
- replace all punctuation and white space in variable names of smartphone data with an underscore
- combine subject ids from 'subject_train.txt' and 'subject_test.txt' and assign variable name 'subject'
- combine activity labels from 'y_train.txt' and 'y_test.txt' and assign variable name 'activity'
- transform variable 'activity' to factor variable with levels and labels corresponding to 'activity_labels.txt'
- combine subject ids, activity labels, and smartphone data into one dataframe 'fulldata'
- create a new dataframe "summarise" with the average of each measurement grouped by subject and activity
- create a tidy data set "tidydata" by melting the summmarise dataframe to tall format