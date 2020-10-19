require(shiny)
require(shinydashboard)
require(GGally)
require(psych)
require(plotly)
require(hash)

source("overview_ui.R")
source("dataOverview_ui.R")
source("userInputs_ui.R")
source("predictiveModel_ui.R")
source("references_ui.R")

#Load in predictive model
load(file = "baggingmodel.rda")

#Load data
data <- read.csv("Z-Alizadeh_sani_dataset.csv", header = TRUE)

df <- data.frame(Age=0, Weight=0, Height=0, Sex="M")
