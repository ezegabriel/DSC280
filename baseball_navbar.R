# this is the baseball app we worked on in class on 1/19

library(shiny)
library(shinyWidgets)
library(ggplot2)
library(readxl)

CCBData <- read_excel("Game 1 v Berry.xlsx")

ui <- navbarPage(
          title <- "Baseball Navbar", 
          
           tabPanel("Data Page", tableOutput("data")
                    ),
           
           tabPanel("Bar Chart of Pitch Counts",
                    sidebarLayout(
                      sidebarPanel(
                        pickerInput(
                          inputId = "Pitcher", label = "Select Pitcher",
                          multiple = T, choices = unique(CCBData$Pitcher), selected = unique(CCBData$Pitcher),
                          options = list(`actions-box` = T)
                        )),
                      mainPanel(
                        plotOutput("pitchcounts")
                      ))
                    ),
          
          tabPanel("Scatterplot of Breaks",
                   sidebarLayout(
                     sidebarPanel(
                       pickerInput(
                         inputId = "Pitcher2", label = "Select Pitcher",
                         multiple = T, choices = unique(CCBData$Pitcher), selected = unique(CCBData$Pitcher),
                         options = list(`actions-box` = T)
                       )),
                     mainPanel(
                       plotOutput("breaks")
                     ))
                   )
)


server <- function(input, output, session) {
  
  # output data in a table
  output$data <- renderTable({
    CCBData
  })
  
  # output bar chart of pitch counts by pitcher
  output$pitchcounts <- renderPlot({
    ggplot(subset(CCBData, Pitcher %in% input$Pitcher),aes(x=Pitcher))+geom_bar(fill='lightblue')+theme_classic()
  })
  
  # output of scatterplot of horizontal and vertical breaks by pitcher
  output$breaks <- renderPlot({
    ggplot(subset(CCBData, Pitcher %in% input$Pitcher2), aes(x=HorzBreak, y=InducedVertBreak, color=TaggedPitchType)) + geom_point()
  })
}

shinyApp(ui, server)