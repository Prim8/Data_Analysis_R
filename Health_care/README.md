# Goal of the project
===

The goal of this work was to write functions that sort throught a dataset and determine the best hospital in the US based on mortality rates or the name of a hospital given its rank.
 

# Description of the data set
===

* one .csv file ("outcome-of-care-measures.csv" including 4706 records of 46 variables) or medicare records from the the U.S. Department of Health and Human Services. The dataset (available  [here](http://www.medicare.gov/hospitalcompare/search.html?AspxAutoDetectCookieSupport=1)) contains information such as mortality and readmission rates for heart attack, heart failure, or pneumonia for over 4,000 hospitals in the US.
 

# Functions
===
 
### Function 1: "best_US_hospital.R"

The script I wrote for this first function take two arguments: 

1. 2-character abbreviated name of a state
2. outcome (i.e. "heart attack", "heart failure", or "pneumonia")

This function returns a character vector with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specied outcome (i.e. "heart attack", "heart failure", or "pneumonia") in that state. 

The following conditions apply:

* Hospitals that do not have data on a particular outcome are excluded from the set of hospitals when deciding the rankings. 
* The function checks the validity of its arguments. If an invalid state value is passed to best, thefunction should throw an error the message "invalid state". 
* Similarly, if an invalid outcome value is passed, the function throws the message "invalid outcome".

For instance, after calling `source("best_US_hospital.R"))`, my function returns:

```
# best_US_hospital("TX", "heart attack")
## "CYPRESS FAIRBANKS MEDICAL CENTER"

# best_US_hospital("TX", "heart failure")
## "FORT DUNCAN MEDICAL CENTER"

# best_US_hospital("MD", "heart attack")
## "JOHNS HOPKINS HOSPITAL, THE"

# best_US_hospital("MD", "pneumonia")
## "GREATER BALTIMORE MEDICAL CENTER"

# best_US_hospital("BB", "heart attack")
## Error in best_US_hospital("BB", "heart attack") : invalid state

# best_US_hospital("NY", "hert attack")
## Error in best_US_hospital("NY", "hert attack") : invalid outcome

```



### Function 2: "hospital_rank.R"

My second function takes three arguments: 

1. 2-character abbreviated name of a state
2. outcome (i.e. "heart attack", "heart failure", or "pneumonia")
3. ranking of a hospital in that state for that outcome (num)
The function returns a character vector with the name of the hospital that has the ranking specied by the "num" argument.

The following conditions apply:

* The num argument can take values "best", "worst", or an integer indicating the ranking
* If the number given by num is larger than the number of hospitals in that state, then the function returns NA.
* Hospitals that do not have data on a particular outcome are excluded from the set of hospitals when deciding the rankings
* Handling ties (for ranks) are broken by using the hospital name alphabetically

For instance, after calling `source("hospital_rank.R")`, my function will return:

```
# hospital_rank("WA", "heart attack", 7)
## "YAKIMA VALLEY MEMORIAL HOSPITAL"

# hospital_rank("NC", "heart attack", "worst")
## "WAYNE MEMORIAL HOSPITAL"

# hospital_rank("NY", "heart attak", 7)
## Error in hospital_rank("NY", "heart attak", 7) : invalid outcome

# hospital_rank("WA", "pneumonia", 1000)
## NA
```
