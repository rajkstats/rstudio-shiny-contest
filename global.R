# Clear Environment
rm(list=ls())

# Required packages
library(jsonlite) # Required to convert between Json & R object
library(httpuv)  # Allows R code to listen for and interact with HTTP and WebSocket clients
library(httr)  # Required for Oauth 2.0
library(tidyverse) # Set of pkgs for data science: dplyr, ggplot2, purrr, tidyr, ...
library(plyr) # the split-apply-combine paradigm for R
library(shiny) # Web Application Framework for R
library(shinythemes) # Return the URL for a Shiny theme
library(devtools) # Collection of package development tools.
library(shinyjs) #Easily improve the user experience of your Shiny apps in seconds
library(shinyWidgets) # Custom inputs widgets for Shiny.
library(rsconnect) # Deployment Interface for R Markdown Documents and Shiny Applications
library(data.table)
options(warn=-1)
# Sanitizing the error messages if any, across the app
options(shiny.sanitize.errors = TRUE)

# Can be github, linkedin etc depending on application
oauth_endpoints("github")

# Change based on what you
app <- oauth_app(appname = "Rshinycontest",
                 key = "*****************************",
                 secret = "**********************************************")

# Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), app)
gtoken <- config(token = github_token)


