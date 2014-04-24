pollutant_average <- function(directory, pollutant, id = 1:332) {
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
    pol.subset <- subset(complete.dat, ID >= id[1] & ID<= id[length(id)])
    
    # calculate the mean of the pollutant, omitting null values
    if (pollutant == "nitrate") {
        mean(pol.subset$nitrate, na.rm=T)
    } else {
        mean(pol.subset$sulfate, na.rm=T)
    }
}
