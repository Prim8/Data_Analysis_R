## Rendered version of the html file

Click  [Activity_monitoring.html](http://htmlpreview.github.io/?https://github.com/Prim8/Data_Analysis_R/blob/master/Activity_monitoring/Activity_monitoring.html) for a rendered version of the analysis:

## Description of the project

This project makes use of data collected from an anonymous individual who used a personal activity monitoring device to record the number of steps taken in 5-minute intervals each day. The data ("activity.zip") consists of two months of observations (October and November 2012) for a total of 17,568 entries and 3 variables. The variables included in the dataset are:

1. **steps**: Number of steps taking in a 5-minute interval (missing values are coded as NA)
2. **date**: The date on which the measurement was taken in YYYY-MM-DD format
3. **interval**: Identifier for the 5-minute interval in which measurement wastaken


This project was conducted in multiple parts. The [Activity_monitoring.html](http://htmlpreview.github.io/?https://github.com/Prim8/Data_Analysis_R/blob/master/Activity_monitoring/Activity_monitoring.html) documents in details the steps taken to conduct this study. The "figure" folder contains the plots used for this study. 

The steps taken for this study are the following:

### 1- Loading and preprocessing the data

a. Load the data 

b. Process/transform the data into a format suitable for the analysis


### 2- What is mean total number of steps taken per day?

-- Missing values are ignored for this part) --

1. Make a histogram of the total number of steps taken each day

2. Calculate and report the **mean** and **median** total number of steps taken per day


### 3- What is the average daily activity pattern?

1. Make a time series plot of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)

2. Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?


### 4- Imputing missing values


1. Calculate and report the total number of missing values in the dataset (i.e. the total number of rows)

2. Devise a strategy for filling in all of the missing values in the dataset. Use the mean or median for that day, or the mean for that 5-minute interval.

3. Create a new dataset that is equal to the original dataset but with the missing data filled in.

4. Make a histogram of the total number of steps taken each day and Calculate and report the **mean** and **median** total number of steps taken per day. Do these values differ from the estimates from the first part of the assignment? What is the impact of imputing missing data on the estimates of the total daily number of steps?


### 5- Are there differences in activity patterns between weekdays and weekends?

Use the dataset with the filled-in missing values for this part.

1. Create a new factor variable in the dataset with two levels -- "weekday" and "weekend" indicating whether a given date is a weekday or weekend day.

2. Make a panel plot containing a time series plot of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all weekday days or weekend days (y-axis). 