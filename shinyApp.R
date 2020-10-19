source("ui.R")
source("server.R")

if (interactive()) {
  shinyApp(ui, server)
}