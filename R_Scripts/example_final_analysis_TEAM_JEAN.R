TEAM_NAME="team_jean"
VERSION="R version 3.5.3 (2019-03-11)"

load_data <- function(path){
  # Loads the data using base R.
  # 
  data <- read.csv(path, stringsAsFactors = T)
  data
}


computer_use_001 <- function(data){
  # Computer use is defined as either above or below the mean value, 
  # averaged over the week.
  
  # IMPORTS
  library(tidyverse)
  
  
  # DEFINE COMPUTER USE
  # Assign average numeric values for each of the categories
  data <- mutate(data, comp_week = fct_recode(comp_week, 
                                              "0.1" = "Less than 1 hour", 
                                              "1.5" = "1-2 hours", 
                                              "3.5" = "3 or more hours"), 
                 comp_week = as.character(comp_week), 
                 comp_week = as.numeric(comp_week))
  
  data <- mutate(data, comp_wend = fct_recode(comp_wend, 
                                              "0.5" = "Less than 1 hour", 
                                              "1.5" = "1-2 hours", 
                                              "3.5" = "3 or more hours"), 
                 comp_wend = as.character(comp_wend), 
                 comp_wend = as.numeric(comp_wend))
  
  # Creat an average score
  data <- mutate(data, comp_use = (5.0/7.0)*comp_week + (2.0/7.0)*comp_wend)
  
  # Categorize comp use as either above the mean or below the mean
  mean_comp_use <- mean(data$comp_use, na.rm=T)
  data <- mutate(data, comp_use = factor(comp_use > mean_comp_use))
  data
}

depression_001 <- function(data){
  # This function defines depression using 'has_dep_diag' and
  # 'dep_thoughts', weighted towards has_dep_diag.
  
	#IMPORTS:
	library(tidyverse)

	#PARAMETERS:
  DEP_THOUGHTS_MULT <- 0.1  # relative weight of depressive thoughts (min:0.0, max:1.0) 

	#DEFINE DEPRESSION:
  #na is filled to zero to give a minimum threshold
  data$dep_thoughts <- data$dep_thoughts %>% replace_na(0)
  data$depression <- 1*(data$has_dep_diag=="Yes ICD-10 diagnosis of depression") + DEP_THOUGHTS_MULT*data$dep_thoughts
  
  # Now dichotomize:
  mean_comp_use <- mean(data$depression, na.rm=T)
  data <- mutate(data, depression = factor(depression > mean_comp_use))
  data

}

transformation_001 <- function(data){
  # This selects some variables to use in final model
  # IMPORTS
  library(tidyverse)
  
  # PARAMETERS
  VARIABLES_TO_USE <- c('depression', 'comp_use', 'iq', 'weight_16', 'height_16')
  
  # select data
  data <- select(data, VARIABLES_TO_USE)
  data
}

specify_model <- function(data){
  
  # logistic regression model
  model <- glm("depression ~ comp_use + iq + weight_16 + height_16", family=binomial, data=data)
  
  # log odds ratio s.e. and lower/upper bounds for CI
  lor <- model$coefficients[2]
  lse <- summary(model)$coefficients[2,2]
  llb <- lor - 2*lse
  lub <-  lor + 2*lse
  
  # exponentiate
  or <- exp(lor)
  ci <- exp(c(llb, lub))
  
  # the results 
  # Note: DIC not necessary (not Bayes/Hierarchical model)
  #       data must be returned as part of a list because R can't return multiple objects
  results <- list('aic' = model$aic, 
                 'or_1' = exp(model$coefficients[2]), 
                 'p_1' = summary(model)$coefficients[2,4], 
                 'ci_1' = ci, 
                 'mod' = model, 
                 'data' = data)
  results
}

data <- load_data(path = 'output/maps-synthetic-data-v1.1.csv')
data <- computer_use_001(data)
data <- depression_001(data)
data <- transformation_001(data)
results <- specify_model(data)


