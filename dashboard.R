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
  # Sidebar menu, remember to label each section with a big title even tho we have the sidebar info
  dashboardSidebar(sidebarMenu(
    menuItem("What is RYLAZE?", tabName = "tab1"),
    menuItem("Mechanism of Action", tabName = "tab2"),
    menuItem("Dosage & Administration", tabName = "tab3"),
    menuItem("Clinical Trial Data", tabName = "tab4"),
    menuItem("Pricing & Insurance", tabName = "tab5"),
    menuItem("Additional Information", tabName = "tab6")
  )),
  # Individual tabs
  dashboardBody(
    tabItems(
    # First tab content
    tabItem(tabName = "tab1",
            h2("What is RYLAZE?")
    ),
    
    tabItem(tabName = "tab2",
            h2("Mechanism of Action")
    ),
    
    tabItem(tabName = "tab3",
            h2("Dosage & Administration")
    ),
    
    tabItem(tabName = "tab4",
            h2("Clinical Trial Data")
    ),
    
    tabItem(tabName = "tab5",
            h2("Pricing & Insurance")
    ),
    
    tabItem(tabName = "tab6",
            h2("Additional Information")
    )
  )
  )
)



server <- function(input, output) { }

shinyApp(ui, server)

