library(shiny)
references <- c(tags$li("Abrams, J. (2005). Chronic Stable Angina. The New England Journal of Medicine, 352(24),
                    2524–2533. doi: 10.1056/NEJMcp042317"),
                tags$li("Alfaro, E., Gamez, M., & Garcia, N. (2013). adabag: An R Package for Classification with
                                    Boosting and Bagging. Journal of Statistical Software, 54(2), 1-35. Retrieved from
                                    http://www.jstatsoft.org/v54/i02/"),
                tags$li("Amin, A. P., Jones, P., Arnold, S., Norris, C. M., Salisbury, A., Cohen, D., & Spertus, J.
                                    (2012). SUPPORTING SHARED DECISION-MAKING IN CHRONIC STABLE
                                    ANGINA: PREDICTING SYMPTOMS, FUNCTION AND QUALITY OF LIFE AT
                                    1 YEAR FROM THE APPROACH STUDY. Journal of the American College of
                                    Cardiology, 59(13), E1441. doi: 10.1016/S0735-1097(12)61442-9"),
                tags$li("Areias, M. E. G., Pinto, C. I., Vieira, P. F., Teixeira, F., Coelho, R., Freitas, I., ...Areias, J. C.
                                    (2013). Long term psychosocial outcomes of congenital heart disease in adolescents
                                    and young adults. Chinese Journal of Contemporary Pediatrics, 15(10), 810–816. doi:
                                    10.7499/j.issn.1008-8830.2013.10.002"),
                tags$li("Bekkouche,S., Wawrzyniak, J., Whittaker, S., Ketterer, W., & Krantz, S. (2013).
                                    Psychological and Physiological Predictors of Angina During Exercise-Induced
                                    Ischemia in Patients With Coronary Artery Disease. Psychosomatic Medicine, 75(4),
                                    413–421. doi: 10.1097/PSY.0b013e31828c4cb4"),
                tags$li("Bennet, B., Vijila, K. S., & Hubert, C. (2012). Knowledge Mining and Trifle Management for
                                    Predicting Heart Disease. International Journal of Advanced Research in Computer
                                    Science; Udaipur, 3(7). Retrieved from
                                    http://search.proquest.com/docview/1775327761/abstract/603F33B8EE0B4115PQ/1"),
                tags$li("Boehmke, B., & Greenwell, B. (2019). Hands-on machine learning with R. Chapman and
                                    Hall/CRC."),
                tags$li("Breiman, L., Cutler, A., Liaw, A., and Wiener, M. (2018). randomForest: Breiman and
                                    Cutler’s Random Forests for Classification and Regression. R package version 4.6-14.
                                    https://CRAN.R-project.org/package=randomForest"),
                tags$li("Brunet, M. (2014). Target diagnosis rates in primary care are misleading and unethical. BMJ :
                                    British Medical Journal, 349(dec02 7), g7235. doi: 10.1136/bmj.g7235"),
                tags$li("Chang, W., Cheng, J., Allaire, J., Xie, Y., & McPherson, J. (2020). shiny: Web Application
                                    Framework for R. R package version 1.4.0.2. https://CRAN.R-project.org/package=shiny"),
                tags$li("Chen, T., He, T., Benesty, M., Khotilovich, V., Tang, Y., Cho, H., Chen, K., Mitchell, R.,
                                    Cano, I., Zhou, T., Li, M., Xie, J., Lin, M., Geng, Y., and Li, Y. (2019). xgboost:
                                    Extreme Gradient Boosting. R package version 0.90.0.2. https://CRAN.R-project.org/package=xgboost"),
                tags$li("Connolly, H. M., Schaff, H. V., Abel, M. D., Rubin, J., Askew, J. W., Li, Z., ... Pellikka, P.
                                    A. (2015). Early and Late Outcomes of Surgical Treatment in Carcinoid Heart
                                    Disease. Journal of the American College of Cardiology, 66(20), 2189–2196. doi:
                                    10.1016/j.jacc.2015.09.014"),
                tags$li("Domanski, M.J., Garg, R., & Yusuf, S. (1994). Prognosis in Congestive Heart Failure.
                                    Congestive Heart Failure: Pathophysiology, Diagnosis, and Comprehensive
                                    Approach to Management, 1(1), 622–627. doi: 10.1007/978-1-4613-8315-4_33"),
                tags$li("Ewart, S. B., Happell, B., Bocking, J., Platania‐Phung, C., Stanton, R., & Scholz, B. (2017).
                                    Social and material aspects of life and their impact on the physical health of people
                                    diagnosed with mental illness. Health Expectations, 20(5), 984–991. Doi:"
                )
)
