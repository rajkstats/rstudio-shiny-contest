trending <-  reactive({
  source('00_Scripts/trending_on_github.R')
  trending_repos <- trending_github_repos(input$language,input$since,gtoken)
  return(trending_repos)
}) 

output$fork_slider <- renderUI({
  trending_repos <- trending()
  max_f <- round_any(max(trending_repos$Forks), 1000, f = ceiling) 
  
  sliderInput(
    inputId = "forks", 
    label = "Repo Forks",
    min   = 0,
    max   =  max_f,
    value = c(0,max),
    width='100%'
  )
})



output$stars_slider <- renderUI({
  trending_repos <- trending()
  max_s <- round_any(max(trending_repos$Stars), 1000, f = ceiling) 
  
  sliderInput(
    inputId = "stars", 
    label = "Repo Stars",
    min   = 0,
    max   =  max_s,
    value = c(0,max),
    width='100%'
  )
})

output$trending_ds_repo <-  renderTable({
  trending_repos <- trending()
  trending_repos <- trending_repos %>% filter(trending_repos$Forks >= input$forks,trending_repos$Stars >= input$stars)
  trending_repos[,4:5] <- sapply(trending_repos[,4:5], FUN=function(x) prettyNum(x, big.mark=","))
  trending_repos
},striped =  TRUE, bordered = TRUE,  
hover = TRUE,spacing = "l", width = "auto",digits = 0,sanitize.text.function = function(x) x,
caption = "Trending Repositories On Github")


