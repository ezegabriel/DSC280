library(shiny)
library(ggplot2)
library(shinyWidgets)
library(readxl)

CCBData <- read_excel('Game 1 v Berry.xlsx')

ui <- fluidPage(  
  pickerInput(inputId = "pitcher", label = "Select Pitcher", choices = unique(CCBData$Pitcher), multiple = T, selected = 'Morgan, Luc'),
  options = list(`actions-box` = T),
  textOutput('result'))
server <- function(input, output, session) {    
  output$result <- renderText({     
    paste0(paste(input$pitcher, collapse=", "))  
  })
  output$plot <- renderPlot(ggplot(subset(CCBData, pitcher %in% input$pitcher), aes(x=Pitcher)) + geom_bar())}
shinyApp(ui, server)


