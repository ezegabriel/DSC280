# Example
# 1) What is the problem with the code? Change it to make it work.
# 2) Then, extend the app to allow the user to set the value of the multiplier, y, between 1 and 50, Vso that the app yields the value of x * y.

ui <- fluidPage(
  sliderInput("x", label = "If x is", min = 1, max = 50, value = 30),
  sliderInput("y", label = "Multiplier (1-50)", min = 1, max = 50, value = 5),
  "then x times y is",
  textOutput("product")
)

server <- function(input, output, session) {
  
  output$product <- renderText({ 
    input$x * input$y
  })
}

shinyApp(ui, server)