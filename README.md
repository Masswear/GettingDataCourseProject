==================================================================
Course Project: Getting and Cleaning Data [Link to Course on Coursera.org](class.coursera.org/getdata-011)
==================================================================
by Masswear
==================================================================

The course project was to prepare a tidy data set from data collected from smartphones' accelerometers [1].

#Files

The project repo includes the following files:

- 'Readme.md'
- 'run_analysis.R': contains the R code to clean up the data
- 'CodeBook.md': describes the variables, the data, and any transformations or work that were performed to clean up the data

#The run_analysis.R script performs the following steps (for details refer to comments in run_analysis.R):

- create and run a function to merge and label the smartphone data in a dataframe called "fulldata"
- create a new dataframe "summarise" with the average of each measurement grouped by subject and activity
- create a tidy data set "tidydata" by melting the summmarise dataframe to tall format

#Required R packages

The following R packages need to be installed using download.packages():

- dplyr (by Hadley Wickham)
- reshape2 (by Hadley Wickham)

#Notes

- The smartphone data has to be stored in a folder called "data" in the current working directory for the script to run.
- Smartphone data files are described in the respective 'README.txt' of the dataset

==================================================================
References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012