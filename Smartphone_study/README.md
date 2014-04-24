Human Activity Recognition Using Smartphones Dataset
===

Goal
---
The goal of this study is to manipulate a set of data files (located under folder "Data") and reshape the data into a "clean and tidy" format that can be used to perform further analyses (see "sensor.data.txt"). I provide a brief summary of the experiment and data used for the study below. Detailed explanation is provided in the "Data" folder. 

I clearly explain each step of the analysis in the "Rmd" document. 

Experiment
---
* 30 volunteers between 19 and 48 years old
* Each volunteer was subject to 6 type of activity while wearing a smartphone (Samsung Galaxy S II). Activities are labelled as follows:
    1. Walking
    2. Walking upstairs
    3. Walking downstairs
    4. Sitting
    5. Standing
    6. Laying

Data used
---
* **561 features**

The features selected for this study come from the embedded accelerometer and gyroscope of the smartphone (i.e. sensors) and are fully explained in the "feature_info.txt" file.

In brief, the embedded accelerometer and gyroscope of the smartphone (i.e. sensors) was used to capture the following:

* 3-axial linear acceleration (accelerometer)
    * gravitational acceleration signal (total acceleration)
    * body motion signal (body acceleration)
* 3-axial angular velocity (gyroscope)

A total of 561 features were measured (see "features.txt" for a complete list).

* **10,299 records**

Separate "train" and "test" folders were provided (i.e. training and test sets) with each containg three text files of interest: 

  1. suject id (e.g. "suject_train.txt")
  2. data for the 561 features (e.g. "X_train.txt"")
  3. activity id (e.g. "y_train.txt") 
    
Each text file contains 7,352 and 2,947 records for the "train" and "test" folders, respectively (total = 10,299 records)

I performed all analysis in R version 3.0.2





