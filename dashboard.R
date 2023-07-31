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
      
    tabItem(tabName = "tab1",
            h2("What is RYLAZE?")
    ),
    
    tabItem(tabName = "tab2",
            h2("Mechanism of Action")
    ),
    
    tabItem(tabName = "tab3",
            h2("Dosage & Administration"),
            h4("10 mg cristntasparase recombinant in 0.5 mL (20 mg/mL) Solutions for IM Injection"),
            h4("Ready to use, contains six doses to replace previously planned pegaspargase dose"),
            fluidRow(
              tabBox(
                side = "right", title = "Administration Schedule",
                # The id lets us use input$tabset1 on the server to find the current tab
                id = "tabset1", height = "250px",
                tabPanel("Friday", "*Information on Dosage amounts/precautions*"),
                tabPanel("Wednesday", "*Information on Dosage amounts/precautions*"),
                tabPanel("Monday", "*Information on Dosage amounts/precautions*")
              )
            )
    ),
    
    tabItem(tabName = "tab4",
            h2("Clinical Trial Data")
    ),
    
    tabItem(tabName = "tab5",
            h2("Pricing & Insurance")
    ),
    
    tabItem(tabName = "tab6",
            h2("Additional Information"),
            h3(style = "text-decoration: underline;","Contact us"),
            h4("Mississauga Corporate Office: 647-946-8801"),
            h4("Medical Information Requests: jazzpharma@medcomsol.com"),
            h3(style = "text-decoration: underline;","Send questions directly to a Jazz Sales Rep"),
            h4("*will create standard fill out form with contact info and questions linked to excel sheet*")
    )
  )
  )
)



server <- function(input, output) { }

shinyApp(ui, server)

