library(shiny)


ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)

### prints data summary and data table
# server <- function(input, output, session) {
#   output$summary <- renderPrint({
#     dataset <- get(input$dataset, "package:datasets")
#     summary(dataset)
#   })
# 
#   output$table <- renderTable({
#     dataset <- get(input$dataset, "package:datasets")
#     dataset
#   })
# }

# ### same as above, but less redundant -- only retrieves data once
server <- function(input, output, session) {
  # Create a reactive expression
  dataset <- reactive({
    get(input$dataset, "package:datasets")
  })

  output$summary <- renderPrint({
    # Use a reactive expression by calling it like a function
    summary(dataset())
  })

  output$table <- renderTable({
    dataset()
  })
}


shinyApp(ui, server)