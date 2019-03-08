# Contains instructions needed to build the app
library(shiny) # Some advanced functionality depends on the shiny package being loaded server-side
library(shinyjs)

# Define server function required to create the datatable info
server <- function(input, output,session) {
  
  # Simulate work being done for 1 second
  show("loading-content") # make the loading pane appear
  
  Sys.sleep(1)

  show("app-content")
 
  # Making the inputs reactive 
  reactive({
    req(input$username)
  })

  # logic for rendering logo
  output$img <- renderUI({
    tags$img(src = "gd.png", width = 100)
  })
  
  
  # include logic for each tab
  source(file.path("server", "tab-dsi.R"),   local = TRUE)$value
  source(file.path("server", "tab-tr.R"),   local = TRUE)$value
  source(file.path("server", "tab-td.R"),   local = TRUE)$value
  source(file.path("server", "tab-about.R"),   local = TRUE)$value


  # Hide the loading message when the rest of the server function has executed
  hide("loading-content",anim=TRUE, animType = "fade") # make the loading pane disappear

}









