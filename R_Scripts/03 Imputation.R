library(mice)
library(tidyverse)
library(DataExplorer)
library(janitor)
library(naniar)
dat <- read_csv("maps-synthetic-data.csv") %>% rename(ID = X1)


vars_model1 <- c("dep_score", "text_wend", "text_week", "tv_wend", "tv_week",
                 "comp_week", "comp_wend")

dat_1 <- select_at(dat, .vars = c(vars_model1, "ID"))


histogram(~ dep_score | is.na(text_wend), data=dat_1)
histogram(~ dep_score | is.na(text_week), data=dat_1)
histogram(~ dep_score | is.na(tv_wend), data=dat_1)









ini <- mice(dat_1, maxit = 0)
meth <- ini$meth
meth

meth[c(2, 3, 4, 5,6,7)] <- "norm"
meth

pred <- ini$pred

pred[, "ID"] <- 0

imp1 <- mice(dat_1, meth = meth, pred = pred, print = FALSE)

summary(mice::complete(imp1))
summary(dat_1)

class(imp1)

