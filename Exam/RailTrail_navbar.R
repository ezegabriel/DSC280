library(shiny)
library(shinyWidgets)
library(mosaicData)
library(ggplot2)

ui <- navbarPage(
          title <- "RailTrail Hiker Data", 
          
          tabPanel(
            "Info", paste0("This app gives information about the RailTrail weather and
                   the volume of hikers on the trail.")
          ),
          
          tabPanel(
            "Data Page", tableOutput("data")
          )
)


server <- function(input, output, session) {
  
  # output data in a table
  output$data <- renderTable({
    RailTrail
  })
  
}

shinyApp(ui, server)