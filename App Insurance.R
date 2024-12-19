

library(shiny)
library(ggplot2)
library(ROCR)

filtered_data <- insurance_data_filtered

# Define UI
ui <- fluidPage(
  titlePanel("Insurance Charges Analysis Dashboard"),
  sidebarLayout(
    sidebarPanel(
      h3("Filters"),
      selectInput("region", "Region", choices = unique(filtered_data$region)),
      sliderInput("age", "Age", min(filtered_data$age), max(filtered_data$age), value = c(20, 60)),
      selectInput("smoker", "Smoker Status", choices = c("yes", "no"))
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Summary",
                 plotOutput("roc_curve"),
                 tableOutput("conf_matrix")),
        tabPanel("Violin Plot",
                 plotOutput("violin_plot")),
        tabPanel("Prediction Tool",
                 numericInput("age_input", "Age", value = 30, min = 18, max = 64),
                 numericInput("bmi_input", "BMI", value = 25, min = 15, max = 50),
                 numericInput("children_input", "Children", value = 2, min = 0, max = 5),
                 selectInput("smoker_input", "Smoker", choices = c("yes", "no")),
                 selectInput("region_input", "Region", choices = unique(filtered_data$region)),
                 actionButton("predict", "Predict"),
                 textOutput("prediction_result"))
      )
    )
  )
)

# Define Server
server <- function(input, output, session) {
  # Filtered data based on inputs
  filtered <- reactive({
    filtered_data[filtered_data$region == input$region &
                    filtered_data$smoker == input$smoker &
                    filtered_data$age >= input$age[1] &
                    filtered_data$age <= input$age[2], ]
  })
  
  # ROC Curve
  output$roc_curve <- renderPlot({
    perf <- performance(pred, "tpr", "fpr")
    plot(perf, colorize = TRUE, main = "ROC Curve")
    abline(a = 0, b = 1, col = "red", lty = 2)
  })
  
  # Confusion Matrix
  output$conf_matrix <- renderTable({
    table(Predicted = test_predictions, Actual = test_data$High)
  })
  
  # Violin Plot
  output$violin_plot <- renderPlot({
    ggplot(filtered_data, aes(x = smoker, y = charges, fill = smoker)) +
      geom_violin() +
      labs(title = "Charges by Smoker Status", x = "Smoker", y = "Charges") +
      theme_minimal()
  })
  
  # Prediction Tool
  observeEvent(input$predict, {
    new_data <- data.frame(
      age = input$age_input,
      bmi = input$bmi_input,
      children = input$children_input,
      smoker = input$smoker_input,
      region = input$region_input
    )
    prob <- predict(logistic_model, newdata = new_data, type = "response")
    output$prediction_result <- renderText({
      paste("Predicted Probability of High Charges:", round(prob, 2))
    })
  })
}

# Run the Shiny App
shinyApp(ui = ui, server = server)
