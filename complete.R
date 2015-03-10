complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  paths <- file.path(directory, paste(formatC(id, width=3, flag="0"), ".csv", sep=""))
  data <- do.call(rbind, lapply(paths, read.csv))
  df <- data.frame(table(factor(data[with(data, !is.na(data$sulfate) & !is.na(data$nitrate)), "ID"], id)))
  colnames(df) <- c("id", "nobs")
  df
}