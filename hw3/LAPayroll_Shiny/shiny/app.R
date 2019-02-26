#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(shinythemes)
library(tidyverse)

### Import the RDS datasets ###
TotalPay <- readRDS("TotPay.rds")
HighestPay <- readRDS("HighestPay.rds")
MeanPay <- readRDS("MeanPay.rds")
MedPay <- readRDS("MedPay.rds")
HighestCost <- readRDS("HighestCost.rds")
HighestAnnual <- readRDS("HighestAnnual.rds")


# Define UI for application that draws a histogram
ui <- navbarPage( 
  theme = shinytheme("cerulean"), 
  "LA City Employee Payroll Analysis",
  tabPanel("Total Payroll by LA City",
           titlePanel("Total Payroll by LA City"),
           plotOutput(outputId = "TotalPay_plot")
  ),
  # For question 1
  tabPanel(
    "Who earned most?",
    titlePanel("Who earned most?"),
    sidebarLayout(
      sidebarPanel(
        numericInput(
          "rows",
          "Choose number of row:",
          10,
          min = 0,
          max = 20
        ),
        numericInput("year", "Choose a year:",
                     2017, min = 2013, max = 2017)
      ),
      
      mainPanel(tableOutput(outputId = "high_pay"))
    )
  ))  


# Define server logic required to draw a histogram
server <- function(input, output) {
  # For question 1
  output$TotalPay_plot <- renderPlot({
    ggplot(data = TotalPay, aes(x = Year, y = payment, fill = class)) +
      geom_bar(stat = "identity")
  })

  
}

# Run the application 
shinyApp(ui = ui, server = server)

