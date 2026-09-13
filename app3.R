
animals <- c("dog", "cat", "snake", "bird", "hedgehog", "other")

ui <- fluidPage(
  numericInput("num", "Number one", value = 0, min = 0, max = 100),
  sliderInput("num2", "Number two", value = 50, min = 0, max = 100),
  sliderInput("rng", "Range", value = c(10, 20), min = 0, max = 100),
  dateInput("dob", "When were you born?"),
  dateRangeInput("springBreak", "What are the dates of your spring break?"),
  selectInput("state", "Which state would you most like to visit?", state.name),
  radioButtons("animal", "What's your favorite animal?", animals),
 
  textOutput("statement")
)

server <- function(input, output, session) {
  output$statement <- renderText({ 
    paste0("You should travel to ", input$state, " on ", paste(input$springBreak, collapse=" to "), ".")
  })
  
}

shinyApp(ui, server)
