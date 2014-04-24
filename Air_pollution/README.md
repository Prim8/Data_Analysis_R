# Goal of the project
===

The goal of the project was simply in theory but was complex to implement. Given a zip file with 332 comma-separated-value (.csv) files, my goal was to write three functions to calculate different measurements on subsets of the data (e.g. a given selection of files).
 

# Description of the data set
===

* 332 .csv files (total of 772,087 observations of 4 variables)
 
The folder "pollution_data" includes 332 .csv files containing pollution monitoring data for fine particulate matter (sulfate and nitrate). Each .csv file corresponds to a specific location in the United States (thus 332 locations) and contains measurements from a single monitor. Here is an example of one .csv file (only 2 rows shown):

Date| sulfate| nitrate| ID
-----|--------|--------|----
2005-05-06| NA| NA| 11
2005-05-07| 0.802| 0.111| 11

Brief description of each variable:
 
1. Date: the date of the observation in YYYY-MM-DD format (year-month-day)
2. sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
3. nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)
4. ID: the ID number of the monitor


The number of records for each .csv file varies by location and sums up to 771,087 observations all 332 .csv files inlcuded.

# Functions
===
 
### Function 1: "pollutant_average.R"

I wrote a function named 'pollutant_average' that reads a directory full of files (in this case "pollution_data" with its 332 .csv files) and calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors, ignoring any missing values coded as NA. The function 'pollutant_average' takes three arguments:

1. 'directory' # location of the files
2. 'pollutant' # type of pollutant (nitrate of sulfate)
3. 'id' # monitor id


For instance, after calling `source("pollutant_average.R")`, my function returns:

```
# pollutant_average("pollution_data", "sulfate", 1:10)
## 4.064

# pollutant_average("pollution_data", "nitrate", 70:72)
## 1.706

# pollutant_average("pollution_data", "nitrate", 23)
## 1.281
```



### Function 2: "complete_cases.R"

My second function reads a directory of files (first argument) and reports the number of complete observed cases (i.e. neither of the variable include missing values) for each file id specified as a second argument. My function returns a dataframe where the first column is the file id and the second column is the corresponding number of complete cases. 

For instance, after calling `source("complete_cases.R")`, my function will return:

```
# complete_cases("pollution_data", 1)
##   id nobs
## 1  1  117

# complete_cases("pollution_data", c(2, 4, 8, 10, 12))
##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96

# complete_cases("pollution_data", 30:25)
##   id nobs
## 1 30  932
## 2 29  711     # notice that in this example
## 3 28  475     # the order in which the function
## 4 27  338     # was called is preserved
## 5 26  586     
## 6 25  463

# complete_cases("pollution_data", 3)
##   id nobs
## 1  3  243
```


### Function 3: "pollutant_correlation.R"

My third function takes a directory of data files as a first argument and a threshold for complete cases as a second argument. It calculates the correlation between sulfate and nitrate for monitor locations where the number of complete observed cases is greater than the specified threshold. My function returns a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function returns a numeric vector of length 0.

For instance, after calling `source("complete_cases.R")` and `source("pollutant_correlation.R")`, my function will return:

```
# test <- pollutant_correlation("pollution_data", 150)
# head(test)
## [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589

# summary(test)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630

# test <- pollutant_correlation("pollution_data", 400)
# head(test)
## [1] -0.01896 -0.04390 -0.06816 -0.07589  0.76313 -0.15783

# summary(test)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.1760 -0.0311  0.1000  0.1400  0.2680  0.7630

# test <- pollutant_correlation("pollution_data", 5000)
# summary(test)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 

# length(test)
## [1] 0

# test <- pollutant_correlation("pollution_data")
# summary(test)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -1.0000 -0.0528  0.1070  0.1370  0.2780  1.0000

# length(test)
## [1] 323
```







