# adds hyperlinks to df

#&entry.844325190=99999&entry.166518206=888888


createFormLinks <- function(dataframe){
  basicFormURL <- "https://docs.google.com/forms/d/e/1FAIpQLSfqSXh2pMbbO9km0IFYl4DEQbpTgmf-88bjfkpGSMyw9uIxpQ/viewform?usp=pp_url"
  basicMapURL <- "https://www.google.com/maps/search/?api=1&query="
  basicObsURL <- "https://docs.google.com/forms/d/e/1FAIpQLSdXUE2BVhzMWS9FgA1H3FuTeSjAG0QWDpF8StdSno8Wh-eo4A/viewform?usp=pp_url"
  urlobs <- 'https://docs.google.com/spreadsheets/d/12UrAPu96rbjzFuqlTIaklLiFUNPFxCYOxtTmAbL786A/edit?usp=sharing'
  obsdtf <- read.csv(text=gsheet2text(urlobs, format='csv'), stringsAsFactors=FALSE,fileEncoding = "UTF-8",encoding = "UTF-8")[,1]
  dataframe$Observations <- lapply(dataframe$OBJECTID,FUN=function(x) sum(obsdtf == x))

  
  dataframe$formURL <- paste0(
                        
                        '<strong>Point ',
                        dataframe$OBJECTID,
                        '</strong><br />',
                        '<br /><a href ="',
                        basicMapURL,
                        st_coordinates(dataframe)[,'Y'],
                        ",",
                        st_coordinates(dataframe)[,'X'],
                        '"',
                        "> Directions </a><br /><br />",
                       '<a href ="',
                       basicFormURL,
                       "&entry.316463768=",
                       dataframe$OBJECTID,
                       "&entry.585624925=",
                       st_coordinates(dataframe)[,'Y'],
                       ",",
                       st_coordinates(dataframe)[,'X'],
                       '"',
                       "> Assessment </a> <br /><br />    ",
                       '<a href ="',
                       basicObsURL,
                       "&entry.844325190=",
                       dataframe$OBJECTID,
                       "&entry.166518206=",
                       st_coordinates(dataframe)[,'Y'],
                       ",",
                       st_coordinates(dataframe)[,'X'],
                       '"',
                       "> Observations </a> (",
                       dataframe$Observations,
                       ")"
                       
                       
        
                       )
  

  
  dataframe <- st_as_sf(dataframe, coords =c("longitude","latitude"), crs = 4326)
  return (dataframe)
}



