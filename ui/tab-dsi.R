# tab -1 Data Science Influencers
tabPanel("Data Science Influencers",fluid = TRUE,
         # Sidebar layout with a input and output definitions
         br(),
         
         sidebarLayout(
           
           # Inputs
           sidebarPanel(
             tags$style(type='text/css', 
                        ".selectize-input { 
                        font-size: 12pt; 
                        line-height: 13pt;} 
                        .selectize-dropdown {
                        font-size: 12pt; 
                        line-height: 13pt;}"),
             
             # Enter the github username
             
             textInput(inputId = "username",
                       h6(" Enter a valid github username"),placeholder = "hadley, hmason",
                       width = '400px')
             ,width = 2
             
             ), #SidePanel closed
           
           # Outputs
           
           mainPanel(
             
             
             tags$style(type="text/css",
                        ".shiny-output-error { visibility: hidden; }",
                        ".shiny-output-error:before { visibility: hidden; }"
             ), 
             withSpinner(tableOutput("github_info")), style = "font-size:12px"
           ) # main panel closed
           ) #side bar layout closed
         )