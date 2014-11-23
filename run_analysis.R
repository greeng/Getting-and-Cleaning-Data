# Download files from URL below to your working directory
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# See the ReadMe and CodeBook for further details.

# Load data files
Xtest <- read.table("./test/X_test.txt")
Ytest <- read.table("./test/Y_test.txt")
TestSub <- read.table("./test/subject_test.txt")
Xtrain <- read.table("./train/X_train.txt")
Ytrain <- read.table("./train/Y_train.txt")
TrainSub <- read.table("./train/subject_train.txt")
feature <- read.table("features.txt")
act_lab <- read.table("activity_labels.txt")

# Checked file dimmensions, now combine accordingly
names(Xtest) <- t(feature[2]) #Transpose and add variable names to columns
names(Xtrain) <- t(feature[2]) #Transpose and add variable names to columns
tt <- rbind(Xtest,Xtrain) # Combine test and train

# Get mean() and sd()
m <- grep("mean()", names(tt), fixed = TRUE) #Get column numbers for mean(), not meanFreq
s <- grep("std()", names(tt)) #Get column numbers for std()
ms <- sort(c(m,s)) #Combine and sort columns so in original order
mstt <- sapply(tt[ms],cbind) #Make matrix of mean() and std()

# Add subject and activity columns to mean and std test/train data
act <- rbind(Ytest,Ytrain) #Combine activity codes for test and train
sub <- rbind(TestSub,TrainSub) #Combine subject codes for test and train
names(sub) <- "Subject" #Add column name for sujects
names(act) <- "Activity" #Add column name for activity
asms <- cbind(act, sub, mstt) #Add activity and subject columns to ms
asms <- asms[order(asms[,2],asms[,1]), ]

#Compute mean of means and stds for each activity, each feature, and each subject?
ASM <- vector()
S <- length(unique(asms$Subject)) # Count for loop to get mean for each subject
A <- length(unique(asms$Activity)) # Count for loop to get mean for each activity

for(i in 1:S){
          sub_vect <- vector()
          for(j in 1:A){
               act_vect <- vector()
               act_vect <- sapply(asms[asms$Activity == j  #Indicator for activity
                                & asms$Subject == i, ]   #Indicator for subject
                                , mean)                  #Calc mean for sub/act
               sub_vect <- rbind(sub_vect, act_vect)  
               
               j <- j + 1
          } 
          ASM <- rbind(ASM, sub_vect)

     i <- i + 1
} 

#Create vector of activity names to match ASM
Activity <- vector()
N <- length(act_lab[,1]) #for loop for replacing numbers with labels
for(i in 1:N){
     
     iv <- ASM[,1] == i #creates a logical vector where TRUE if equals i
     Activity[iv] <- as.character(act_lab$V2[i]) #replace activity numbers with label
     
     i <- i + 1
} 
RAD <- as.data.frame(ASM)
RAD$Activity <- Activity

# Write data table to directory as assigned
write.table(RAD, file = "RA_Data.txt", row.names = FALSE, sep = ",")
