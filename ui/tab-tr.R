# tab -2 Trending Repos data science

tabPanel( 
  "Trending Repos in Data Science",fluid = TRUE, br(),
  # Sidebar layout with a input and output definitions
  br(), sidebarLayout(
    
    
    # Inputs
    sidebarPanel(
      tags$style(type='text/css', 
                 ".selectize-input { 
                 font-size: 12pt; 
                 line-height: 13pt;} 
                 .selectize-dropdown {
                 font-size: 12pt; 
                 line-height: 13pt;}"),
      
      br(),
      
      selectInput(inputId = "language",
                  label = "Language",
                  choices = c("R","Python"),
                  selected = c("R")),
      
      selectInput(inputId = "since",
                  label = "Trending",
                  choices = c("Daily","Weekly","Monthly"),
                  selected = c("Weekly")), 
      
      chooseSliderSkin("Modern"),
      uiOutput("stars_slider"),
      uiOutput("fork_slider"),
      width = 2
      ), #SidePanel closed
    # Outputs
    mainPanel(
      withSpinner(tableOutput("trending_ds_repo")),
      style = "font-size:12px"
    ) # main panel closed
    ) #side bar layout closed
  )