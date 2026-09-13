library(shiny)
library(ggplot2)
library(shinyWidgets)
library(readxl)
CCBData <- read_excel("Game 1 v Berry.xlsx")


ui <- navbarPage(
          title = "Example Shiny Navbar", 
          
           tabPanel("About Page", 
                   paste0("This app uses navbar for the layout & mtcars as the data.")
           ),
           
           
           tabPanel("Data Page", tableOutput("data")),
           
           
           tabPanel("Bar Chart",
                    sidebarLayout(
                      sidebarPanel(
                        pickerInput(inputId = "pitcher", label = "Select Pitcher", choices = unique(CCBData$Pitcher), multiple = T, selected = unique(CCBData$pitcher)),
                        options = list(`actions-box` = T),
                        textOutput('result')),
                        sliderInput("bins", "Select # of bins for histogram.", min = 5, max = 20, value = 10)
                      ),
                      mainPanel(
                        plotOutput("pitchcounts")
                      )
                    )
           )



server <- function(input, output, session) {
  
  # for display of mtcars dataset in the "Data Page"
  output$data <- renderTable({
    CCBData
  })
  
  # for display of histogram in the "Widget & Sidepar page"
  output$hist_cars <- renderPlot({
    ggplot(mtcars, aes(x=mpg)) + geom_histogram(fill ="blue", bins=input$bins) + theme_classic()
  })
  
  # for display of mtcars dataset summary statistics in the "Menu item A page"
  output$summary <- renderPrint({
    summary(mtcars)
  })
  # output$scatter <- renderPlot({
  #   ggplot(CCBData, aes(y = InducedVertBreak, x = HorzBreak, ))
  # })
}

shinyApp(ui, server)