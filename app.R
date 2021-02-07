# SHINY APP CODE
#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(tidyverse)
library(psych)
library(knitr)
library(rio)
library(cowplot)
library(colorblindr)
library(shiny)

df <- import(here::here("data", "data.RData"), setclass = "tbl_df") 
choice_c <- levels(df$country)
# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Teacher Payment"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
     select_country <- selectizeInput(
       'select_country', label = NULL, selected = c('USA', 'Argentina'), choices = choice_c, multiple = T,
       options = list(placeholder = 'select a country name')
        )
     ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: ----
      textOutput("countries")
      
    ) # Closing sidebarPanel
  ) # Closing sidebarLayout
) # Closing FluidPage

# Define server logic required to draw a histogram ----
server <- function(input, output, session) {
  output$countries <- renderText({
    paste0(input$select_country, ",")
  })
  
}

# RUN THE THANG
shinyApp(ui, server)