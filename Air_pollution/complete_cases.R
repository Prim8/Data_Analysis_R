complete_cases <- function(directory, id = 1:332) {
    # set up the directory 
    dir <- paste(getwd(), "/", directory, sep="")
    setwd(dir)
    
    # merge all 332 csv files into a one data set (complete.dat)
    files <- list.files(path = getwd())     
    complete.dat <- do.call("rbind", lapply(files, read.csv, header = TRUE))
    
    # move up a folder to automatically go back to the main directory
    # when running the function multiple times
    setwd("..")
    
    # subset the complete data set according to the id specified in the third
    # argument of the function
    pol.subset <- complete.dat[complete.dat$ID %in% id, ]
    
    # get the complete cases for the IDs specified in the function
    not.null <- complete.cases(pol.subset) # rows with no missing values
    not.null <- cbind(pol.subset$ID, not.null) # rows with no missing values with corresponding IDs
    
    results <- tapply(not.null[,2], not.null[,1], sum) # results in "array" format
    
    # create data frame to display the results
    df = as.data.frame.table(results)
    colnames(df) <- c("ids", "nobs")
    
    # check if "id" in the function is called in ascending or descending order
    if (id[1] < id[length(id)]) {
        df = df
    } else {
        df = df[order(df$ids, decreasing = T), ]
    }
    df
}