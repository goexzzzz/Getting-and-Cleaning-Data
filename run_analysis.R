#################################################################################################
# The data for the project is at the below URL: 
#     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
################################################################################################# 
XTrainData <- read.table("train/X_train.txt")
XTestData <- read.table("test/X_test.txt")
XData <- rbind(XTrainData, XTestData)
SubjectTrainData <- read.table("train/subject_train.txt")
SubjectTestData <- read.table("test/subject_test.txt")
SubjectData <- rbind(SubjectTrainData, SubjectTestData)
YTrainData <- read.table("train/y_train.txt")
YTestData <- read.table("test/y_test.txt")
YData <- rbind(YTrainData, YTestData)
Features <- read.table("features.txt")
MeanStdFeatureIndices <- grep("-mean\\(\\)|-std\\(\\)", Features[, 2])
XData <- XData[, MeanStdFeatureIndices]
names(XData) <- Features[MeanStdFeatureIndices, 2]
names(XData) <- gsub("\\(|\\)", "", names(XData))
names(XData) <- tolower(names(XData))
ActivitiesNames <- read.table("activity_labels.txt")
ActivitiesNames[, 2] = gsub("_", "", tolower(as.character(ActivitiesNames[, 2])))
YData[,1] = ActivitiesNames[YData[,1], 2]
names(YData) <- "activity"
names(SubjectData) <- "subject"
MergedData <- cbind(SubjectData, YData, XData)
NumOfCols = dim(MergedData)[2]
RowNum = 1
Subjects = unique(SubjectData)[,1]
NumOfSubjects = length(Subjects)
NumOfActivities = length(ActivitiesNames[,1])
AverageMergedData = MergedData[1:(NumOfSubjects * NumOfActivities), ]
for (SubIndex in 1:NumOfSubjects) {
  for (ActIndex in 1:NumOfActivities) {
	AverageMergedData[RowNum, 1] = Subjects[SubIndex]
	AverageMergedData[RowNum, 2] = ActivitiesNames[ActIndex, 2]
	DataSlice <- MergedData[MergedData$subject==SubIndex & MergedData$activity==ActivitiesNames[ActIndex, 2], ]
	AverageMergedData[RowNum, 3:NumOfCols] <- colMeans(DataSlice[, 3:NumOfCols])
	RowNum = RowNum + 1
  }
}
write.table(AverageMergedData, "Average_Merged_Data_Set.txt",row.name=FALSE)