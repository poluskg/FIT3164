#FILENAME: ui_helper.R
#PURPOSE: To load in all required libraries/files on app configuration

#Load in all required libraries

require(shiny)
require(shinydashboard)
require(GGally)
require(psych)
require(plotly)
require(hash)
require(stringr)
require(tidyverse)

# VB_style is a function that is used to display the boxes
# @param: msg the sting that will be displayed
# @param: style the font size of the string
# @return: format of the message and style needed by the UI
VB_style <- function(msg = 'Hello', style="font-size: 100%;"){
  tags$p( msg , style = style )
}


# source all the R code needed
# check the files exist to satisfy robustness
file.exists("overview_ui.R")
source("overview_ui.R")

file.exists("dataOverview_ui.R")
source("dataOverview_ui.R")

file.exists("userInputs_ui.R")
source("userInputs_ui.R")

file.exists("modellingProcess_ui.R")
source("modellingProcess_ui.R")

file.exists("predictiveModel_ui.R")
source("predictiveModel_ui.R")

file.exists("references_ui.R")
source("references_ui.R")

#Load in predictive model & processed data
file.exists("z.Rdata")
load(file = "z.Rdata")

file.exists("baggingmodel.rda")
load(file = "baggingmodel.rda")

#Load original data for static model use
file.exists("Z-Alizadeh_sani_dataset.csv")
data <- read.csv("Z-Alizadeh_sani_dataset.csv", header = TRUE)

attach(data)
# data frame for the scatterplot on data overview
za_cont <- data.frame(Age, Weight, Length, BMI, BP, PR, Function.Class, CR, TG, LDL,
                      HDL, BUN, ESR, HB, K, Na, WBC, Lymph)

