##load necessary packages dplyr and reshape2
library("dplyr")
library("reshape2")

##create a function to merge and label the data
merge <- function(){
        
        ##read data into dataframes and merge training and test set
        data <- rbind(read.table("data/train/X_train.txt"), read.table("data/test/X_test.txt"))
        
        ##read features into data frame
        features <- read.table("data/features.txt")
        
        ## assign features as variable names to columns of data
        colnames(data) <- features[["V2"]]
        
        ##extract columns with measurements of mean and standard deviation
        mean_std <- data[grepl("mean[()]|std[()]", colnames(data))]
        
        ##clean features by removing all punctuation or spaces (one or muliple) and replace with underscore
        colnames(mean_std) <- gsub("[[:punct:]]+| +", "_", colnames(mean_std))
        
        ##read subjects into data frames and merge training and test set
        subject <- rbind(read.table("data/train/subject_train.txt"), read.table("data/test/subject_test.txt"))
        
        ##assign variable name to subjects
        colnames(subject) <- "subject"
        
        ##read activities performed into data frames and merge training and test set
        activity <- rbind(read.table("data/train/y_train.txt"), read.table("data/test/y_test.txt"))
        
        ##assign variable name to activities
        colnames(activity) <- "activity"
        
        ##read activity labels
        act_labels <- read.table("data/activity_labels.txt")
        
        ##assign descriptive activity names to name the activities in the data set
        activity[,1] <- factor(activity[,1], levels = act_labels[,1], labels = act_labels[,2])
        
        ##combine subject, activity and data
        cbind(subject, activity, mean_std)
        }

##run the function merge to merge and label the data to a dataframe called "fulldata"
fulldata <- merge()

##create a new dataframe "summarise" with average of each measurement grouped by subject and activity
summarise <- fulldata %>% group_by(subject, activity) %>% summarise_each(funs(mean))

##create tidy data by melting the summmarise dataframe to tall format
tidydata <- melt(summarise, id.vars = c("subject", "activity"), measure.vars = colnames(summarise[,3:68]), variable.name = "feature")