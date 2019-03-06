# This script reads a google sheet and returns it as a dataframe

library(gsheet)
getPools <- function(dtf){
  # returns point ID's of points that have been classified as not suitable
  return(dtf[which(dtf$El.punt.d.aigua.és.adequat. == 'No (piscina, ciment, edifici...)'),2])
}

# url of gsheet which contains form answers
url <- 'https://docs.google.com/spreadsheets/d/1rHUTv2m6N1cmx4gP0zwKxRBQok9Zr-FEBmf90Ksp7eU'

# creates dataframe from google sheet answers

getIncomplete <- function(dtf){
  dtf <- read.csv(text=gsheet2text(url, format='csv'), stringsAsFactors=FALSE)
  return (dtf[which(dtf$Visita.finalitzada == "No"),2])
}


