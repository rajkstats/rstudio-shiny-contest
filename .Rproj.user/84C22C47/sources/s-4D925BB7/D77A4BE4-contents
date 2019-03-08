

output$github_info <- renderTable({
  source('00_Scripts/github_user_info.R')
  user_info <- github_user_info(input$username,gtoken,0)
  user_info$Avatar_Url<- paste0('<img src="',user_info$Avatar_Url,'" height="52"></img>')
  colnames(user_info)[9]<-c("User")
  user_info <- user_info %>% select(9,1:7)
  user_info
}, bordered = TRUE,  
hover = TRUE,striped =  TRUE, spacing = "l", width = "auto", digits = 0,sanitize.text.function = function(x) x,
caption = "Github User Portfolio")