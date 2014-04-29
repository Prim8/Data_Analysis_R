########################### PART 2 ###############################

hospital_rank <- function(state, outcome, num = "best") {
    ## read data
    original.data <- read.csv("./Data/outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available")
    
    # reduce the original dataset to include only the columns of interest
    hospital <- original.data[, c("Hospital.Name",
                                  "State", 
                                  "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", 
                                  "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", 
                                  "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
                              ]
    
    # label the columns for simplicity
    colnames(hospital) <- c("Name", "State", "heart.attack", "heart.failure", "pneumonia")
    
    # change columns to numeric values
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
    rank.hospital <- character()
    
    # subset the data based on the state
    subset.state <- subset(hospital, hospital$State == state)
    
    # re-order the subset by outcome
    rank.heart.attack <- subset.state[do.call(order, subset.state[c(3, 1)]), ]
    rank.heart.attack <- subset(rank.heart.attack, !(is.na(rank.heart.attack$heart.attack)))
    
    rank.heart.failure <- subset.state[do.call(order, subset.state[c(4, 1)]), ]
    rank.heart.failure <- subset(rank.heart.failure, !(is.na(rank.heart.failure$heart.failure)))
    
    rank.pneumonia <- subset.state[do.call(order, subset.state[c(5, 1)]), ]
    rank.pneumonia <- subset(rank.pneumonia, !(is.na(rank.pneumonia$pneumonia)))
    
    # alternative way of ranking (e.g. rank.heart.attack)
    # rank.heart.attack <- subset.state[order(subset.state[, c(3, 1)]), ]
    
    # deal with num argument = "best" or "worst"
    if (num == "best") {
        num <-  1
    } else if (num == "worst" & outcome == "heart attack") {
        num <- nrow(rank.heart.attack)
    } else if (num == "worst" & outcome == "heart failure") {
        num <- nrow(rank.heart.failure)
    } else if (num == "worst" & outcome == "pneumonia") {
        num <- nrow(rank.pneumonia)
    } else if (num > nrow(rank.heart.attack) 
               | num > nrow(rank.heart.failure)
               | num > nrow(rank.pneumonia)) {
        rank.hospital <- NA
    }
    
    
    if (outcome == "heart attack") {
        rank.hospital <- rank.heart.attack[num, 1]
    } else if (outcome == "heart failure") {
        rank.hospital <- rank.heart.failure[num, 1]
    } else if (outcome == "pneumonia") {
        rank.hospital <- rank.pneumonia[num, 1]      
    }
    rank.hospital
}
