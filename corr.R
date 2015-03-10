corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  corr.file <- function(filename){
    data <- read.csv(filename)
    num <- sum(complete.cases(data))
    if(num > threshold)
      # compute correlation
      cor(data$sulfate, data$nitrate, use="complete.obs")
  }
  
  paths <- list.files(directory, pattern='\\.csv', full.names = TRUE)
  allCorr <- sapply(paths, corr.file)
  myCorr <- allCorr[ ! sapply(allCorr, is.null) ]
  myCorr <- unname(unlist(myCorr))
  if(length(myCorr) < 1)
    myCorr <- vector(mode="numeric", length=0)
  myCorr
}