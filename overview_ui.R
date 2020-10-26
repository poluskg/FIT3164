#FILENAME: overview_ui.R
#PURPOSE: Removes cluter from ui.R by storing text/text-style in separate file.
#         Adhere to OOP development structure. Keep all relevant code for the
#         Introduction tab in the same file for simple code navigation.

overviewText1 <- div(p(tags$b("Heart disease"), "is usually caused by a",
                  tags$b("buildup of cholesterol and other fatty acids"),
                  "in major arteries, and is relatively common outcome from one or more factors such as: obesity,
                  diet, chronological age, smoking, congenital and chronic conditions and family history of cardiac disease. The prevalence of heart disease has also been increasing in recent years, now accounting for around",
                  tags$b("30% of global deaths.")),
                 p("Due to the large amount of risk factors, medical research has largely focussed on",
                  tags$b("identifying unique predictors and outcomes"), "of heart disease, including: genetics,
                  physiology, gender, ethnicity and behavious. As being able to identify and target specific risk factors can effectively improve patient outcomes and quality of life, this project delivers a",
                  tags$b("statistical model to predict if one may have heart disease.")))

overviewText2 <- tags$br(div("This interactive application translates medical and statistical research into an",
                  tags$b("accessible and user friendly exploration"), "of heart disease risks and outcomes in order 
                  to promoteawareness and prevention of heart disease. This", tags$b("novel patient-centered approach"), 
                  "allows one to explore and understand risks and symptoms of heart disease identified by our model and",
                  tags$b("facilitate conversations and informed decision making"), 
                  "between the user and appropriate medical professionals.",
                  tags$br(em("This model is not a diagnostic tool, as it is outside the scope of knowledge of our development team, and therefore unethical to provide a medically sound tool."))))