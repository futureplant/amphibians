# Get custom urls for navigation and forms based on selected points in the UI

getFormURL <- function(longitude,latitude,pointID){
  # basic url that leads to the form
  basicURL <- "https://docs.google.com/forms/d/e/1FAIpQLSfqSXh2pMbbO9km0IFYl4DEQbpTgmf-88bjfkpGSMyw9uIxpQ/viewform?usp=pp_url"
  
  # paste longitude and latitude together in order to put them in the final url
  coordinates <- paste0(longitude,
                        ",",
                        latitude)
  
  # creates the url that will lead to a filled out form
  url <- paste0(basicURL,
                "&entry.316463768=",
                pointID,
                "&entry.585624925=",
                coordinates
                )
  return (url)
}

