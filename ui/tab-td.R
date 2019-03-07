tabPanel("Trending Developers in Data Science", fluid = TRUE, br(),br(),
         # Sidebar layout with a input and output definitions
         
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
             # Explanatory text
             #HTML(paste0("Pick from dropdown")),
             
             br(),
             
             selectInput(inputId = "language_dev",
                         label = "Language",
                         choices = c("R","Python"),
                         selected = c("R")),
             
             selectInput(inputId = "since_dev",
                         label = "Trending",
                         choices = c("Daily","Weekly"),
                         selected = c("Weekly")),width = 2
             ), #Side Panel closed 
           # Outputs
           mainPanel(
             withSpinner(tableOutput("trending_ds_dev")),
             style = "font-size:12px"
           ) #main panel closed
           ) #Side layout closed
         )