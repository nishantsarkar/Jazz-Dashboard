# Jazz Case Comp Dashboard

library(shiny)
library(shinydashboard)
library(tidyverse)
library(shinyWidgets)
library(rsconnect)
library(readxl)
library(writexl)

# for one of my plots
trial_results <- data.frame(
  Category = c("Group A", "Group B", "Group C"),
  Count = c(25, 30, 45)
)

trial_results2 <- data.frame(
  Category = c("Group A", "Group B", "Group C"),
  Count = c(35, 20, 45)
)
  
# Basics
ui <- dashboardPage(
  dashboardHeader(title = div(
    HTML('<img src ="https://www.rylaze.com/media/content/images/og-image.jpg" height = "95px" style = "vertical-align: middle;"/>')
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
    # Styles that're referenced later (for the text and two image containers)
    tags$style(HTML("           
         /* Custom CSS Styles */
         .pretty-text {
           font-size: 18px;
           line-height: 1.4;
           color: #297e91;
           text-align: left;
         }
         .image-container {
           display: flex;
           flex-direction: column;
           align-items: center;
         }
         .dual-image-container {
           display: flex;
           justify-content: space-between;
           align-items: center;
     }
    ")),
    tabItems(
    # First tab content
    tabItem(tabName = "tab1",
            h2("What is RYLAZE?", style = "font-weight: bold; font-size: 30px; color: #297e91;"),
            div(class = "image-container",
                HTML('<img src="https://www.clinicaltrialsarena.com/wp-content/uploads/sites/22/2021/07/Image-1-Rylaze.jpg" height="450px" style="vertical-align: middle;"/>')
            ),
            div(class = "pretty-text",
                HTML("<p><strong>RYLAZE</strong> (asparaginase erwinia chrysanthemi) is a medication indicated for healthcare providers to treat patients with acute lymphoblastic leukemia (ALL) and hypersensitivity to <i>Escherichia coli</i>-derived asparaginase. As a crucial component of multi-agent chemotherapy regimens, Rylaze works by depleting circulating levels of the amino acid asparagine, thus depriving leukemic cells of this essential nutrient, leading to their growth inhibition and apoptosis.</p>
                     <p>RYLAZE is the <strong>ONLY</strong> currently-available non-<i>E. coli</i> asparaginase. Furthermore, the innovative recombinant manufacturing process behind RYLAZE is more efficient and reliable than traditional methods of L-asparaginase manufacturing, and the drug comes <strong>ready-to-use.</strong></p>")
            ),
            div(class = "dual-image-container",  
                HTML('<img src="https://www.rylaze.com/media/content/images/dotted-1-x-1000-graphic.svg" style="width: 50%;"/>'),  
                HTML('<img src="https://www.rylaze.com/media/content/images/dotted-syringe.svg" style="width: 50%;"/>')  
            ),
            div(class = "pretty-text",
                HTML("<p><p><i>This section will include additional first-glance information about Rylaze.</i></p></p>")
            )
    ),
    
    tabItem(tabName = "tab2",
            h2("Mechanism of Action", style = "font-weight: bold; font-size: 30px; color: #297e91;"),
            div(class = "pretty-text",
                HTML("<p><p>RYLAZE is an <strong>asparaginase</strong> enzyme derived from <i>Erwinia chrysanthemi</i>. The enzyme functions by catalyzing the hydrolysis of asparagine into aspartic acid and ammonia. While healthy cells have the ability to synthesize asparagine, ALL lymphoblasts lack asparagine synthetase, making them reliant on an external supply of asparagine from the bloodstream.</p></p>
                     <p>Upon administration, Rylaze reduces the circulating levels of asparagine in the body, leading to a condition known as asparagine depletion. As a result, leukemic cells are deprived of this essential nutrient, disrupting their ability to survive and proliferate. The diminished availability of asparagine induces metabolic stress within leukemic cells, leading to cell growth inhibition and eventually triggering apoptosis.</p>
                     <p>Asparaginase has been an integral component of ALL treatment regiments for over 40 years. The introduction of asparaginase in these protocols has resulted in steady improvements in ALL survival estimates.</p>")
            ),
            div(class = "image-container",
                HTML('<img src="https://www.rylaze.com/media/content/images/charts/chart-improvement-outcomes.svg" height="275px" style="vertical-align: middle;"/>')
            ),
            div(class = "pretty-text",
                HTML("<p>However, the use of <i>E. coli</i>-derived asparaginase may trigger an immune response in some individuals. The antibodies released as a result of this immune response may bind to mast cells and can result in the release of mediators that cause clinical symptoms (including histamine). This can result in hypersensitivity reactions (HSRs). These occur in up to 30% of patients, and the resulting treatment failure can <strong>increase the chance of relapse.</strong></p>
                     <p>As a non-pathogenic bacterial enzyme derived from Erwinia chrysanthemi, RYLAZE offers a distinct advantage by <strong>bypassing the immune reactions</strong> triggered by <i>E. coli</i>-derived asparaginase. <strong>By switching to RYLAZE</strong>, healthcare providers can continue asparaginase therapy with a lower risk of compromising treatment efficacy or patient safety. This makes it the best-choice non-<i>E. coli</i> asparaginase for ALL.</p>")
            ),
            div(class = "image-container",
                HTML('<img src="https://www.rylaze.com/media/content/images/graphic-immunology.svg" height="160px" style="vertical-align: middle;"/>')
            ),
    ),
    
    tabItem(tabName = "tab3",
            h2("Dosage & Administration", style = "font-weight: bold; font-size: 30px; color: #297e91;"),
            div(class = "pretty-text",
            h4("10 mg cristntasparase recombinant in 0.5 mL (20 mg/mL) solutions for IM injection.")),
            div(class = "pretty-text",
            h4("Ready to use, contains six doses to replace previously planned pegaspargase dose.")),
            fluidRow(
              tabBox(
                side = "right", title = "Administration Schedule",
                # The id lets us use input$tabset1 on the server to find the current tab
                id = "tabset1", height = "250px",
                tabPanel("Friday", "*To Input: Information on dosage amounts/precautions*"),
                tabPanel("Wednesday", "*To Input: Information on dosage amounts/precautions*"),
                tabPanel("Monday", "*To Input: INPUT Information on dosage amounts/precautions*")
              )
            )
    ),
    
    tabItem(tabName = "tab4",
            h2("Clinical Trial Data", style = "font-weight: bold; font-size: 30px; color: #297e91;"),
            div(class = "pretty-text",
                h4("Based on what was presented during the Case Competition introduction, the following are some mock graphs to show what we can display.
                   In the next round, we will use any data provided by the Jazz team to place meaningful and interactive figures here.")),
            plotOutput("efficacy_time_plot"),
            plotOutput("pie1"),
            plotOutput("pie2"),
            div(class = "pretty-text",
                h3("With access to more data from clinical trials and other demographics, we can create meaningful visuals to present to HCPs."))
    ),
    
    tabItem(tabName = "tab5",
            h2("Pricing & Insurance Information", style = "font-weight: bold; font-size: 30px; color: #297e91;"),
            # Create interactive action buttons for each tab
            div(class = "pretty-text", 
                HTML("<p>Click the tabs below to learn about the <strong>pricing and insurance coverage of RYLAZE</strong> in your jurisdiction.</p>")
            ),
            div(
              actionBttn(inputId = "btn_tab1", label = "Ontario", style = "fill", size = "lg"),
              actionBttn(inputId = "btn_tab2", label = "British Columbia", style = "fill", size = "lg"),
              actionBttn(inputId = "btn_tab3", label = "Alberta", style = "fill", size = "lg"),
              actionBttn(inputId = "btn_tab4", label = "Quebec", style = "fill", size = "lg"),
              htmlOutput("selected_tab_text")
            # These interact with text in the Server function below
            )
    ),
    
    tabItem(tabName = "tab6",
            h2("Additional Information", style = "font-weight: bold; font-size: 30px; color: #297e91;"),
            h3(style = "text-decoration: underline;","Contact us"),
            h4("Mississauga Corporate Office: 647-946-8801"),
            h4("Medical Information Requests: jazzpharma@medcomsol.com"),
            h3(style = "text-decoration: underline;","Send questions directly to a Jazz Sales Rep"),
            textInput("name", "Name:", ""),
            textInput("email", "Email:", ""),
            textAreaInput("question", "Question:", ""),
            actionButton("submit_btn", "Submit"),
            br(),
            downloadButton("download_btn", "Download Data")
    )
  )
  )
)


server <- function(input, output) {
  # Function to update the textbox content based on the selected tab
  # RenderUI is used so we can include both images and text in this section
  observeEvent(input$btn_tab1, {
    output$selected_tab_text <- renderUI({
      list(
        HTML('<img src="https://www.ontario.ca/themes/ontario_2021/assets/ontario@2x-print.png" height="150px" style="vertical-align: middle;"/>'),
        HTML("<div class='pretty-text'><p>Here, information surrounding the pricing and insurance coverage of Rylaze in Ontario can be included.</p></div>")
      )
    })
  })
  
  observeEvent(input$btn_tab2, {
    output$selected_tab_text <- renderUI({
      list(
        HTML('<img src="https://images.squarespace-cdn.com/content/v1/5266d49be4b0bc5cd29ee8e0/1484680378995-KGAYS0LQ4HSMSLXEI5TM/image-asset.png" height="150px" style="vertical-align: middle;"/>'),
        HTML("<div class='pretty-text'><p>Here, information surrounding the pricing and insurance coverage of Rylaze in British Columbia can be included.</p></div>")
      )
    })
  })
  
  observeEvent(input$btn_tab3, {
    output$selected_tab_text <- renderUI({
      list(
        HTML('<img src="https://qb-filing.alberta.ca/assets/img/alberta.png" height="150px" style="vertical-align: middle;"/>'),
        HTML("<div class='pretty-text'><p>Here, information surrounding the pricing and insurance coverage of Rylaze in Alberta can be included.</p></div>")
      )
    })
  })
  
  observeEvent(input$btn_tab4, {
    output$selected_tab_text <- renderUI({
      list(
        HTML('<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Logo_du_le_gouvernement_du_Qu%C3%A9bec.svg/1530px-Logo_du_le_gouvernement_du_Qu%C3%A9bec.svg.png" height="125px" style="vertical-align: middle;"/>'),
        HTML("<div class='pretty-text'><p>Here, information surrounding the pricing and insurance coverage of Rylaze in Quebec can be included.</p></div>")
      )
    })
  })
  
  output$efficacy_time_plot <- renderPlot({
    # Create the plot with empty data
    plot(x = numeric(0), y = numeric(0), type = "n", xlim = c(0,1), ylim = c(0,1),
         main = "RYLAZE Efficacy", xlab = "Hours after Dosage", ylab = "NSAA levels")
  })

  output$pie1 <- renderPlot({
    # Create a pie chart based on the clinical trial results data
    pie(trial_results$Count, labels = trial_results$Category, main = "Phase 2 Results")
  })
  
  output$pie2 <- renderPlot({
    # Create a pie chart based on the clinical trial results data
    pie(trial_results2$Count, labels = trial_results$Category, main = "Phase 3 Results")
  })
  
  data <- reactiveVal(data.frame(Name = character(),
                                 Email = character(),
                                 Question = character()))
  
  observeEvent(input$submit_btn, {
    new_entry <- data.frame(Name = input$name,
                            Email = input$email,
                            Question = input$question,
                            stringsAsFactors = FALSE)
    data(merge(data(), new_entry, all = TRUE))
  })
  
  output$download_btn <- downloadHandler(
    filename = function() {
      paste("data_", Sys.Date(), ".xlsx", sep = "")
    },
    content = function(file) {
      write_xlsx(data(), file)
    }
  )
}


shinyApp(ui, server)



