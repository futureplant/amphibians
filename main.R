# Main file of the amphibian map project

library(shiny)
library(shinydashboard)
library(leaflet)

source("ui.R")

# server serves information to the user interface that is constructed in scripts/ui.R file
server <- function(input, output, session) {
  
  # Render background map for shiny app
  output$map <- renderLeaflet({
    
    # Add default OpenStreetMap map tiles
    leaflet() %>% setView(lng = 1.8243883, lat = 41.728416, zoom = 11) %>%  #  set view to start extent, area over Schiphol Airport   
      addTiles(options = providerTileOptions(minZoom = 7, maxZoom = 15)) #  set min and max zoom level
  })
}

shinyApp(ui, server)

