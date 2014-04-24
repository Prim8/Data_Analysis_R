pollutant_correlation <- function(directory, threshold = 0) {
    # set up the directory 
    dir <- paste(getwd(), "/", directory, sep="")
    setwd(dir)
    
    # merge all 332 csv files into a one data set (complete.dat)
    files <- list.files(path = getwd())     
    complete.dat <- do.call("rbind", lapply(files, read.csv, header = TRUE))
    
    # move up a folder to automatically go back to the main directory
    # when running the function multiple times
    setwd("..")
    
    # get the complete cases for "complete.dat"
    not.null <- complete.cases(complete.dat) # rows with no missing values
    not.null <- cbind(complete.dat, not.null) # rows with no missing values with corresponding IDs
    
    # subset of the data frame with no null values
    not.null <- subset(not.null, not.null == 1) 
    
    # (a) complete cases for each monitor
    source("complete_cases.R")
    complete.all.monitors <- complete("pollution_data") 
    
    # (b) complete cases for monitors above the treshold specified in the function
    treshold.dataset <- subset(complete.all.monitors, complete.all.monitors$nobs > threshold)
    
    # merge (a) and (b) to get the final dataset
    final.dataset <- merge(not.null, treshold.dataset, by.x = "ID", by.y = "ids", all.y=TRUE)
    
    # get correlation
    splt <- split(final.dataset[, 3:4], final.dataset$ID)
    cor <- (lapply(splt, cor)) # list of correlations
    #lapply(cor, '[[', 2)  # This retuns a list with only the second element
    vect <- as.numeric(unlist(lapply(cor, '[[', 2))) # This retuns a vector with the third elements
    vect   
}