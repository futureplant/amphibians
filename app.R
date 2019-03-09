# Main file of the amphibian map project
# testing things

library(shiny)
library(shinydashboard)
library(leaflet)

source("ui.R",encoding = "Latin1")
source("scripts/getpoints.R")
source("scripts/hyperlinks.R")
source("scripts/readgsheets.R",encoding = "Latin1")



# server serves information to the user interface that is constructed in scripts/ui.R file
server <- function(input, output, session) {
  

  
  # url of gsheet which contains form answers
  url <- 'https://docs.google.com/spreadsheets/d/1rHUTv2m6N1cmx4gP0zwKxRBQok9Zr-FEBmf90Ksp7eU'
  # creates dataframe from google sheet answers
  dtf <- read.csv(text=gsheet2text(url, format='csv'), stringsAsFactors=FALSE,fileEncoding = "UTF-8",encoding = "UTF-8")
  
  

  
  pools <- getPools(dtf)
  forbidden <- getNoAccess(dtf)
  incompletes <- getIncomplete(dtf)
  completes <- getCompletes(dtf)
  waterpoints <- getPoints()

  
  # get rd of this line if it doesn't work
  waterpoints = waterpoints[!waterpoints$OBJECTID %in% pools,]
  waterpoints = waterpoints[!waterpoints$OBJECTID %in% forbidden,]
  
  getColor <- function(samples,waterpoints) {
    sapply(waterpoints$OBJECTID, function(OBJECTID) {
      if(OBJECTID %in% incompletes) {
        "orange"
      } else if(OBJECTID %in% completes){
        "green"
      } else {
        "blue"
      } 
      })
  }
  
  icons <- awesomeIcons(
    icon = 'ios-close',
    iconColor = 'black',
    library = 'ion',
    markerColor = getColor(samples,waterpoints)
  )
  
  # Render background map for shiny app
  output$map <- renderLeaflet({
    
    waterlinks <- createFormLinks(waterpoints)
    # Add default OpenStreetMap map tiles
    leaflet(data = waterlinks) %>% setView(lng = 1.8243883, lat = 41.728416, zoom = 13) %>%  
      addTiles() %>% 
      addAwesomeMarkers(
                  icon = icons,
                  popup = ~formURL
                 )
    
    })
}

shinyApp(ui, server)

