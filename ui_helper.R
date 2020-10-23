require(shiny)
require(shinydashboard)
require(GGally)
require(psych)
require(plotly)
require(hash)
require(stringr)
require(tidyverse)

VB_style <- function(msg = 'Hello', style="font-size: 100%;"){
  tags$p( msg , style = style )
}


source("overview_ui.R")
source("dataOverview_ui.R")
source("userInputs_ui.R")
source("modellingProcess_ui.R")
source("predictiveModel_ui.R")
source("references_ui.R")

#Load in predictive model
load(file = "z.Rdata")
load(file = "baggingmodel.rda")

#Load data
data <- read.csv("Z-Alizadeh_sani_dataset.csv", header = TRUE)

