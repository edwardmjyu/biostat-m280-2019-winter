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
library(scales)

### Import the RDS datasets ###
TotalPay <- readRDS("TotPay.rds")
HighestPay <- readRDS("HighestPay.rds")
MeanPay <- readRDS("MeanPay.rds")
MedPay <- readRDS("MedPay.rds")
HighestCost <- readRDS("HighestCost.rds")
HighestAnnual <- readRDS("HighestAnnual.rds")


### Define UI ###
ui <- navbarPage( 
  theme = shinytheme("cerulean"), 
  "LA City Employee Payroll Analysis",
  tabPanel("Total Payroll by LA City",
           titlePanel("Total Payroll by LA City"),
           plotOutput(outputId = "TotalPay_plot")
  ),
  ### Question 1.3 ###
  tabPanel(
    "Who earned most?",
    titlePanel("Who earned most?"),
    sidebarLayout(
      sidebarPanel(
        numericInput(
          "rows3",
          "Input number of rows (0-50):",
          10,
          min = 0,
          max = 50
        ),
        numericInput("Year3", "Input a year between 2013 and 2017:",
                     2017, min = 2013, max = 2017)
      ),
      
      mainPanel(tableOutput(outputId = "highest_pay"))
    )
  ),
  ### Question 1.4 ###
  tabPanel(
    "Which departments earn the most?",
    titlePanel("Which departments earn the most?"),
    sidebarLayout(
      sidebarPanel(
        numericInput(
          "rows4",
          "Input number of rows (0-50):",
          10,
          min = 0,
          max = 50
        ),
        numericInput("Year4", "Input a year between 2013 and 2017:",
                     2017, min = 2013, max = 2017), 
        radioButtons("method", "Select statistic", "Median", 
                     choices = c("Mean", "Median"))
      ),
      
      mainPanel(tableOutput(outputId = "center_pay"))
    )
  ), 
  ### Question 1.5 ###
  tabPanel(
    "Which departments cost the most?",
    titlePanel("Which departments cost the most?"),
    sidebarLayout(
      sidebarPanel(
        numericInput(
          "rows5",
          "Input number of rows (0-50):",
          10,
          min = 0,
          max = 50
        ),
        numericInput("Year5", "Input a year between 2013 and 2017:",
                     2017, min = 2013, max = 2017)
      ),
      
      mainPanel(tableOutput(outputId = "high_cost"))
    )
  ), 
  ### Question 1.6 ###
  tabPanel(
    "Which Class has highest annual pay?",
    titlePanel("Which Class has highest annual pay?"),
    sidebarLayout(
      sidebarPanel(
        numericInput(
          "rows6",
          "Input number of rows (0-50):",
          10,
          min = 0,
          max = 50
        ),
        numericInput("Year6", "Input a year between 2013 and 2017:",
                     2017, min = 2013, max = 2017)
      ),
      
      mainPanel(tableOutput(outputId = "high_annual"))
    )
  )
  
  
  
  )  




# Define server logic required to draw a histogram
server <- function(input, output) {
  ### Question 1.2 ###
  output$TotalPay_plot <- renderPlot({
    ggplot(data = TotalPay, aes(x = Year, y = payment, fill = category)) +
      geom_bar(stat = "identity")
  })
  
  ### Question 1.3 ###
  output$highest_pay <- renderTable({
    HighestPay$Year <- format(HighestPay$Year, digits = 0)
    HighestPay %>% filter(Year == input$Year3) %>% head(input$rows3)
  })
  
  ### Question 1.4 ###
  output$center_pay <- renderTable({
    MeanPay$Year <- format(MeanPay$Year, digits = 0)
    MedPay$Year <- format(MeanPay$Year, digits = 0)
    if (input$method == "Mean") {
      MeanPay %>%  filter(Year == input$Year4) %>% 
        head(input$rows4)
    } else {MedPay %>% filter(Year == input$Year4) %>%
      head(input$rows4)
    }
  })
  ### Question 1.5 ###
  output$high_cost <- renderTable({
    HighestCost$Year <- format(MeanPay$Year, digits = 0)
      HighestCost %>%  filter(Year == input$Year5) %>% 
        head(input$rows5)
  })
  ### Question 1.6 ###
  output$high_annual <- renderTable({
    HighestAnnual$Year <- format(HighestAnnual$Year, digits = 0)
    HighestAnnual %>%  filter(Year == input$Year6) %>% 
      head(input$rows6)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)