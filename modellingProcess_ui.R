modelText <- div("A range of models were generated, altered and tested against the dataset.
                 The resulting accuracy of these models can be viewed in the table below.
                 The final selected model - used for the prediction outcome on the next page - 
                 was the Bagging model, which has a predictive accuracy of 81.31%.")

modelComparison <- matrix(c("59%", "75.82%", "79.12%", "79.1%", "80.2%", "81.31%",
                            0.6839, 0.7387, 0.7169, 0.7481, 0.7487, 0.796), ncol=6, byrow=TRUE)
row.names(modelComparison) <- c("Accuracy", "AUC/ROC")
colnames(modelComparison) <- c("Naive Bayes", "Decision Tree", "Random Forest", "XG2", "SVM Model", "Bagging Model")

nb_ui <- 1
dt_ui <- 2
rf_ui <- 3
xgb_ui <- 4
svm_ui <- 5
bgg_ui <- 6