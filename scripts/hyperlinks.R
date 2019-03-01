# adds hyperlinks to df

createFormLinks <- function(dataframe){
  basicFormURL <- "https://docs.google.com/forms/d/e/1FAIpQLSfqSXh2pMbbO9km0IFYl4DEQbpTgmf-88bjfkpGSMyw9uIxpQ/viewform?usp=pp_url"
  basicMapURL <- "https://www.google.com/maps/search/?api=1&query="
  
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
                       "> Assessment </a> <br />    "
        
                       )
  

  
  dataframe <- st_as_sf(dataframe, coords =c("longitude","latitude"), crs = 4326)
  return (dataframe)
}



