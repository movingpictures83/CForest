library(AppliedPredictiveModeling)
transparentTheme(trans = .4)
library(caret)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")


input <- function(inputfile) {
	set.seed(1234)
	pfix = prefix()
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
   # Need to get the three files
   csvfile <<- paste(pfix, parameters["csvfile", 2], sep="/")

   training <<- read.csv(csvfile)
   fitControl <<- readRDS(paste(pfix, parameters["fitControl", 2], sep="/"))
}

run <- function() {}

output <- function(outputfile) {
result <- train(Class ~ ., data = training, 
                 method = "cforest", 
                 trControl = fitControl)
print(result)
saveRDS(result, outputfile)
}
