origData <- read.csv2(file = 'Jan_2015_ontime.csv', sep = ",", header = TRUE, stringsAsFactors = FALSE)
nrow(origData)
airports <-c('ATL', 'LAX', 'ORD', 'DFW', 'JFK', 'SFO', 'CTL', 'LAS', 'PHX')
origData <- subset(origData, DEST %in% airports & ORIGIN %in% airports)
nrow(origData)
head(origData,2)
tail(origData, 2)
origData$X <- NULL
head(origData, 2)
cor(origData[c("ORIGIN_AIRPORT_SEQ_ID", "ORIGIN_AIRPORT_ID")])
cor(origData[c("DEST_AIRPORT_SEQ_ID", "DEST_AIRPORT_ID")])
origData$ORIGIN_AIRPORT_SEQ_ID <- NULL
origData$DEST_AIRPORT_SEQ_ID <- NULL
missmatched <- origData[origData$OP_CARRIER != origData$OP_UNIQUE_CARRIER, ]
nrow(missmatched)
origData$OP_UNIQUE_CARRIER <- NULL
head(origData, 2)
onTimeData <- origData[!is.na(origData$ARR_DEL15) & (origData$ARR_DEL15 != "")
                       & !is.na(origData$DEP_DEL15) & (origData$DEP_DEL15 != ""),]
nrow(origData)
nrow(onTimeData)
onTimeData$DISTANCE <- as.integer(onTimeData$DISTANCE)
onTimeData$CANCELLED <- as.integer(onTimeData$CANCELLED)
onTimeData$DIVERTED <- as.integer(onTimeData$DIVERTED)
onTimeData$ARR_DEL15 <- as.factor(onTimeData$ARR_DEL15)
onTimeData$DEP_DEL15 <- as.factor(onTimeData$DEP_DEL15)
onTimeData$DEST_AIRPORT_ID <- as.factor(onTimeData$DEST_AIRPORT_ID)
onTimeData$ORIGIN_AIRPORT_ID <- as.factor(onTimeData$ORIGIN_AIRPORT_ID)
onTimeData$DAY_OF_WEEK <- as.factor(onTimeData$DAY_OF_WEEK)
onTimeData$DEST <- as.factor(onTimeData$DEST)
onTimeData$ORIGIN <- as.factor(onTimeData$ORIGIN)
onTimeData$DEP_TIME_BLK<- as.factor(onTimeData$DEP_TIME_BLK)
onTimeData$OP_CARRIER <- as.factor(onTimeData$OP_CARRIER)
tapply(onTimeData$ARR_DEL15, onTimeData$ARR_DEL15, length)
(5624/(21769+5624))
set.seed(122515)
featureCols <- c("ARR_DEL15","DAY_OF_WEEK","OP_CARRIER","DEST","ORIGIN","DEP_TIME_BLK")
ontimedatafiltered <- onTimeData[,featureCols]
intrainrows <- createDataPartition(ontimedatafiltered$ARR_DEL15, p=0.70, list=FALSE)
head(intrainrows, 10)
trainDataFiltered <- ontimedatafiltered[intrainrows, ]
testDataFiltered <- ontimedatafiltered[-intrainrows, ]
nrow(trainDataFiltered)/(nrow(testDataFiltered) + nrow(trainDataFiltered))
nrow(testDataFiltered)/(nrow(testDataFiltered) + nrow(trainDataFiltered))
logisticRegModel <- train(ARR_DEL15 ~ ., data=trainDataFiltered, method = "glm", family = "binomial")
logisticRegModel
logRegPrediction <- predict(logisticRegModel, testDataFiltered)
logRegConfMat <- confusionMatrix(logRegPrediction, testDataFiltered[,"ARR_DEL15"])
logRegConfMat
randomforestModel <- randomForest(trainDataFiltered[-1], trainDataFiltered$ARR_DEL15, proximity = TRUE, importance = TRUE)
rfPrediction <- predict(randomforestModel, testDataFiltered)
rfConfMat <- confusionMatrix(rfPrediction, testDataFiltered[,"ARR_DEL15"])
rfConfMat
