
# trending_github_repos() function returns the weekly trending repos in Python and R respectively using unofficial github trending API

trending_github_repos <- function(language,since,gtoken){
  
  # Trending Repos 
  # Returns author, name, description, url, stars, forks, currentPeriodStars  
  req <- GET(paste0("https://github-trending-api.now.sh/repositories?language=",language,"&since=",since), gtoken)
  print(paste0("https://github-trending-api.now.sh/repositories?language=",language,"&since=",since))
  json1 <- content(req)
  trending_repos<- jsonlite::fromJSON(jsonlite::toJSON(json1))
  trending_repos$name <- paste0('<a href="',trending_repos$url,'">',trending_repos$name ,"</a>")
  trending_repos<- trending_repos %>% select(1,2,5,3,5,8,9,10)
  #trending_repos$url <- paste0('<a href="',trending_repos$url,'">',trending_repos$url ,"</a>")
  author <- unlist(trending_repos$author)
  source('00_Scripts/github_user_info.R')
  author_info<-github_user_info(author,gtoken,1)
  trending_repos$author_avatar <- author_info$Avatar_Url
  trending_repos$author<- paste0('<img src="',trending_repos$author_avatar,'" height="52"></img>')
  trending_repos$stars <- as.numeric(trending_repos$stars)
  trending_repos$forks <- as.numeric(trending_repos$forks)
  trending_repos <- trending_repos %>% select(1,2,3,5,6,7)  
  colnames(trending_repos) <- c("Author","Repository","Description","Stars","Forks","CurrentPeriodStars")
  return(trending_repos)
}

# trending_github_dev() function returns the weekly trending developers in Python and R respectively using unofficial github trending API

trending_github_dev <- function(language,since,gtoken){
  # Trending Developers 
  # Returns username, name, url, avatar, repo  
  req <- GET(paste0("https://github-trending-api.now.sh/developers?language=",language,"&since=",since), gtoken)
  print(paste0("https://github-trending-api.now.sh/developers?language=",language,"&since=",since))
  json1 <- content(req)
  trending_dev <- jsonlite::fromJSON(jsonlite::toJSON(json1))
  trending_dev <- data.table(username = trending_dev$username,name = trending_dev$username,url = trending_dev$url,avatar = trending_dev$avatar,repo_name = trending_dev$repo$name,repo_desc = trending_dev$repo$description,repo_url = trending_dev$repo$url,stringsAsFactors = TRUE)
  
  #checks whether any developer name is NULL, then replace by username
  pos <- which(trending_dev$name == 'NULL')
  ifelse(length(pos) > 0,trending_dev$name[pos]<- trending_dev$username[pos],"ok")
  
  trending_dev$name <- paste0('<a href="',trending_dev$url,'">',trending_dev$username ,"</a>")
  trending_dev$repo_name <- paste0('<a href="',trending_dev$repo_url,'">',trending_dev$repo_name ,"</a>")
  trending_dev$avatar<- paste0('<img src="',trending_dev$avatar,'" height="52"></img>')
  trending_dev <- trending_dev[,c(4,2,5,6)]
  colnames(trending_dev) <- c("Developer","Name","Repository","Description")
  return(trending_dev)
}


