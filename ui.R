# User Interface: Controls the layout and appearance of app 

library(shinyjs)
library(shinycssloaders)

ui <- fluidPage(theme= 'bootstrap.css',
  useShinyjs(),
  includeCSS("www/loading-content.css"),
  # provides styles for the "loading sheet"
  
  tags$head(includeHTML(("www/google-analytics.html"))),
    
  tags$head(
    tags$link(href = "style.css", rel = "stylesheet")
  ),
  
  div(id = "loading-content", "Hard = Those that create something you'd be proud of...",
      img(src = "ajax-loader-bar.gif")),


  # The main app code goes here
  hidden(
    div(
  
    id = "app-content",
       
      # use a gradient in background
      setBackgroundColor(
        color = c("#F5FFFA"),
        gradient = "linear",
        direction = "bottom"
      ),
      
      tags$head(
        # adding fonts using google api
        tags$script(src= '//platform-api.sharethis.com/js/sharethis.js#property=5c8117324c495400114fe854&product=inline-share-buttons',async='async'),
        # Adds browser title
        tags$title("GitDiscoverer"),
        
        tags$style(HTML("
                        @import url('//fonts.googleapis.com/css?family=Titillium+Web:700');
                        
                        h1 {
                        font-family:'Titillium Web', sans-serif;;
                        font-size: 70px;
                        font-weight: 400;
                        letter-spacing: -1px;
                        line-height: 1.2;
                        text-align: -webkit-center;
                        #color: #008B8B;
                      
                        }
                        
                        ")) #style closed
        ) ,# head closed
      

      
      style="padding-top: 5px;",

    # Preparing title panel with title and logo
        fluidRow(
          column(1, uiOutput("img"),style="text-align:left;"),
          column(3, offset = 3,h1("GitDiscoverer"),style="text-align:center;")
          
        )
      ,
      
      # Define the tabs to be used in the app ----
      br(),  
      tags$head(
        tags$style(type='text/css', 
                   ".nav-tabs {font-size: 12px} ")),   
      
    tabsetPanel(
      source(file.path("ui", "tab-dsi.R"),  local = TRUE)$value, # tab 1 closed
      source(file.path("ui", "tab-tr.R"),  local = TRUE)$value , # tab 2 closed
      source(file.path("ui", "tab-td.R"),  local = TRUE)$value, # tab 3 closed,
      source(file.path("ui", "tab-about.R"),  local = TRUE)$value #tab 4 closed
         ) # tabset panel closed
      ) #div closed 
)
)




