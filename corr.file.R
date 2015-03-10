corr.file <- function(filename){
  data <- read.csv(filename)
  num <- sum(complete.cases(data))
  if(num > threshold)
    # compute correlation
    cor(data$sulfate, data$nitrate, use="complete.obs")
}