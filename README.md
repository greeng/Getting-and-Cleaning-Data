Getting-and-Cleaning-Data
=========================

Human Activity Recognition Using Smartphones Dataset
Version 2.0
==================================================================
Jim-Bob James
Dept. of Stuff
Small Time University
Some City, SS 98765, USA
==================================================================

Version 2.0  begins where Version 1.0 left off, which can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. This analysis finds the mean of means and mean of standard deviations for each subject and activity for all measurements taken. The original measurements are discussed in Version 1.0.

The Version 1.0 data was processed by joining the Test and Training data, selecting the mean and standard deviation of each measurement, adding column names, subject id and activity that each measurement was taken from. The mean of all observations mean and standard deviation for a subject doing each activty was calculated, which is the final output.

The dataset includes the following files:
=========================================

- 'Readme.txt'

- 'Codebook.txt': Gives the variable definitions and dimmensions.

- 'run_analysis.R': Is the R script to prepare the dataset, written in "R version 3.1.2 (2014-10-31)" that converts the Version 1.0 files to RA_Data.txt. Script was written on Windows 8.1 platform.

- 'RA_Data.txt': Run Analysis Data of the means of means and stadndard deviations for for each activity and subject. It is comma seperated - 180 X 68

Notes: 
======
- Data to run the analysis can be retrieved from:and can be retrieved from:
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

- To run 'run_analysis.R' the following files must be in the working directory: 
	/test/X_test.txt
	/test/Y_test.txt
	/test/subject_test.txt
	/train/X_train.txt
	/train/Y_train.txt
	/train/subject_train.txt
	features.txt
	activity_labels.txt

- Features are normalized and bounded within [-1,1].

For more information about this dataset contact: jbjames@xxxxx.edu

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Jim-Bob James, Dept. of Stuff, Small Time University, Some City, SS 98765, USA

[2] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

