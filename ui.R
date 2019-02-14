library(shinydashboard)
library(shiny)



# Construct the UI argument for the call to the Shiny App in the main.R script
ui <- dashboardPage(
  dashboardHeader(title = "Amphibians Restoration"),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    fluidRow(column(width = 9,
                    box(width = NULL, solidHeader = TRUE,      #  This constructs a space for the map 
                        leafletOutput("map", height = 500)),
                    box(width = NULL,                          #  This constructs a space for the table
                        uiOutput("overviewTable")
                    )
    ),
    
    column(width = 3,
           
           # Construct box with image and introductory text for the app
           box(HTML("<strong>Amphibians habitat restoration project</strong><br/>
                    <p align='justify'>Welcome to the amphibians restoration program. This is 
                    placeholder text to be filled out by Ferran, displaying detailed information 
                    concerning what participants need to do with the map in order to contribute 
                    to the restoration  program <br/ ><br/ ></p>"), width = NULL, solidHeader = TRUE
                        )
                    )
             )
    )
  )

