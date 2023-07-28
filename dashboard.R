# Jazz Case Comp Dashboard

library(shiny)
library(shinydashboard)
library(tidyverse)

# Basics
ui <- dashboardPage(
  dashboardHeader(title = div(
    HTML('<img src ="https://www.rylaze.com/media/content/images/og-image.jpg" height = "100px" style = "vertical-align: middle;"/>')
    )
  ),
  dashboardSidebar(),
  dashboardBody()
)

server <- function(input, output) { }

shinyApp(ui, server)

