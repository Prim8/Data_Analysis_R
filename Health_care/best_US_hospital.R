best_US_hospital <- function(state, outcome) {
    ## read data
    original.data <- read.csv("./Data/outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available")
    hospital <- original.data[, c("Hospital.Name",
                                  "State", 
                                  "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", 
                                  "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", 
                                  "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
                              ]
    
    colnames(hospital) <- c("Name", "State", "heart.attack", "heart.failure", "pneumonia")
    hospital$heart.attack <- as.numeric(hospital$heart.attack)
    hospital$heart.failure <- as.numeric(hospital$heart.failure)
    hospital$pneumonia <- as.numeric(hospital$pneumonia)
    
    ## check validity of state and outcome
    if (!(state %in% hospital$State)) {
        stop("invalid state")
    } else if (!(outcome %in% c("heart failure", "heart attack", "pneumonia"))) {
        stop("invalid outcome")
    }
    
    ## return hospital name
    best.hospital <- character()
    
    # subset the data based on the state
    subset.state <- subset(hospital, hospital$State == state)
    
    min.heart.attack <- min(subset.state$heart.attack, na.rm=T)
    min.heart.failure <- min(subset.state$heart.failure, na.rm=T)
    min.pneumonia <- min(subset.state$pneumonia, na.rm=T)
    
    if (outcome == "heart attack") {
        best.hospital <- subset.state$Name[which(subset.state$heart.attack == min.heart.attack)]
    } else if (outcome == "heart failure") {
        best.hospital <- subset.state$Name[which(subset.state$heart.failure == min.heart.failure)]
    } else if (outcome == "pneumonia") {
        best.hospital <- subset.state$Name[which(subset.state$pneumonia == min.pneumonia)]     
    }
    best.hospital <- best.hospital[order(best.hospital)]
    best.hospital[1]
}