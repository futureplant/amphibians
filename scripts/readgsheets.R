# This script reads a google sheet and returns it as a dataframe

library(gsheet)
getPools <- function(dtf){
  # returns point ID's of points that have been classified as not suitable
  return(dtf[which(dtf$El.punt.d.aigua.és.adequat. == 'No (piscina, ciment, edifici...)'),2])
}


# creates dataframe from google sheet answers

getIncomplete <- function(dtf){
  nos <- (dtf[which(dtf$Visita.finalitzada == "No"),2])
  yes <- (dtf[which(dtf$Visita.finalitzada == "Si"),2])
  return (setdiff(nos,yes))
}


getCompletes <- function(dtf){
  return((dtf[which(dtf$Visita.finalitzada == "Si"),2]))
}

getNoAccess <- function(dtf){
  # returns point ID's of points that have been classified as not suitable
  return(dtf[which(dtf$Accessibilitat == 'Sense accés'),2])
}

getCount <- function(dtf,id){
  return(dtf[,1])
}
