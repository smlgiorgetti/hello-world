pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  paths <- file.path(directory, paste(formatC(id, width=3, flag="0"), ".csv", sep=""))
  data <- do.call(rbind, lapply(paths, read.csv))
  round(mean(data[[pollutant]], trim = 0, na.rm = TRUE), 3)
}