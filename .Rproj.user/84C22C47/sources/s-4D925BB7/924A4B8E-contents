
output$trending_ds_dev <- renderTable({
  source('00_Scripts/trending_on_github.R')
  trending_github_dev(input$language_dev,input$since_dev,gtoken)
}, striped =  TRUE, bordered = TRUE,  
hover = TRUE,spacing = "l", width = "auto",digits = 0,sanitize.text.function = function(x) x,
caption = "Trending Developers On Github")