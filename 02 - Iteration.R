#Review of 5 approaches: https://www.analyticsvidhya.com/blog/2016/03/tutorial-powerful-packages-imputing-missing-values/

#MICE

library(mice)



#Amelia

#Used when: 

#All variables in a data set have Multivariate Normal Distribution (MVN). It uses means and covariances to summarize data.
#Missing data is random in nature (Missing at Random)


#missForest
library(missForest)



#Hmisc
#Here are some important highlights of this package:
  
# 1. It assumes linearity in the variables being predicted.
# 2. Fisher’s optimum scoring method is used for predicting categorical variables.



