# This script reads a google sheet and returns it as a dataframe

library(gsheet)
getGsheet <- function(){
  # url of gsheet which contains form answers
  url <- 'https://docs.google.com/spreadsheets/d/1rHUTv2m6N1cmx4gP0zwKxRBQok9Zr-FEBmf90Ksp7eU'
  
  # creates dataframe from google sheet answers
  dtf <- read.csv(text=gsheet2text(url, format='csv'), stringsAsFactors=FALSE)
  
  # returns point ID's of points that have been classified as not suitable
  return(dtf[which(dtf$El.punt.d.aigua.�s.adequat. == 'No (piscina, ciment, edifici...)'),2])
}


      