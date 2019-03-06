# Main file of the amphibian map project
# testing things

library(shiny)
library(shinydashboard)
library(leaflet)

source("ui.R")
source("scripts/getpoints.R")
source("scripts/geturls.R")
source("scripts/hyperlinks.R")
source("scripts/readgsheets.R")



# server serves information to the user interface that is constructed in scripts/ui.R file
server <- function(input, output, session) {
  
  samples <- getGsheet()
  waterpoints <- getPoints()
  
  # get rd of this line if it doesn't work
  waterpoints = waterpoints[!waterpoints$OBJECTID %in% samples,]
  
  getColor <- function(samples,waterpoints) {
    sapply(waterpoints$OBJECTID, function(OBJECTID) {
      if(OBJECTID %in% samples) {
        "red"
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
                  popup =  ~formURL
                 )
    
    })
}

shinyApp(ui, server)

