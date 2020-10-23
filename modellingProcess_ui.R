modelText <- div("A range of models were generated, altered and tested against the dataset.
                 The resulting accuracy of these models can be viewed in the table below.
                 The final selected model - used for the prediction outcome on the next page - 
                 was the Bagging model, which has a predictive accuracy of 81.31%.")

modelComparison <- matrix(c("Accuracy", "59%", "75.82%", "79.12%", "79.1%", "80.2%", "81.31%",
                            "AUC/ROC", 0.6839, 0.7387, 0.7169, 0.7481, 0.7487, 0.796),
                          ncol=7, byrow=TRUE)
#row.names(modelComparison) <- c("Accuracy", "AUC/ROC")
colnames(modelComparison) <- c(" ", "Naive Bayes", "Decision Tree", "Random Forest", "XG2", "SVM Model", "Bagging Model")

nb_ui <- div(tags$b("Naive bayes using e1071"),
          tags$br("This algorithm uses Bayes rule to classify data.
          The algorithm predicts the probability that a given datapoint would belong in any particular category,
          and the datapoint is assigned the category with the category with the highest probability.
          In R, this was implemented using the e1071 package."), 
          tags$br("Reference :  (Meyer, Dimitriadou, Hornik, Weingessel & Leisch, 2019)."))
dt_ui <- div(tags$b("Simple rpart Decision Tree"),
          tags$br("This algorithm uses a decision tree to classify data.
          A decision tree is somewhat like a flowchart, where nodes represent an attribute 
          and have branches representing outcomes. The final 'leaf' node then represents the class 
          the given datapoint is categorised into after following the appropriate branches. 
          In R, this was implemented using the rpart package."),
          tags$br("Reference : (Therneau, Atkinson & Ripley, 2019)."))
rf_ui <- div(tags$b("Random Forest"),
          tags$br("This ensemble algorithm uses a collection of decision trees, forming a 'forest', 
          to classify the data. By randomly generating multiple decision trees, the algorithm can 
          more accurately classify the data. In R, this was implemented using the randomForest package."), 
          tags$br("Reference (Breiman, Cutler, Liaw & Wiener, 2018).)"))
xgb_ui <- div(tags$b("Xgboost"),
              tags$br("The boosting classification algorithm is an ensemble method  generates many small, 
              ‘weak’ classifications of the data, and then 'learns' from previous failed classifications 
              to improve. In R, this was implemented using the gbm and XGBoost packages."),
              tags$br("Reference (Greenwell, Boehmke & Cunningham, 2019) (Chen et al., 2019)"))
svm_ui <- div(tags$b("SVM Model"),
              tags$br("A Support Vector Machine (SVM) model creates a 'hyperplane' - a line that 
              best separates the distinct categories of data points. Points are then classified 
              according to which side of this line that they fall on. In R, this was implemented 
              using the e1071 package."), 
              tags$br("Reference: An Introduction to Support Vector Machines (SVM). (2017, June 22). MonkeyLearn Blog."))
bag_ui <- div(tags$b("Bagging Model"),
              tags$br("Bagging using multiple classification trees adabag. This ensemble classification 
              algorithm generates bootstrapped (randomly drawn) samples from the dataset, and then applies 
              a decision tree to each of these samples. The average of each sample prediction is taken to 
              form the final classification. In R, this was implemented using the adabag package."),
              tags$br("Reference (Alfaro, Gamez  & Garcia, 2013)"))
