library(mice)
library(tidyverse)
library(DataExplorer)
library(janitor)
library(naniar)
dat <- read_csv("maps-synthetic-data.csv") %>% rename(ID = X1)


vars_model1 <- c("dep_score", "text_wend", "text_week", "tv_wend", "tv_week",
                 "comp_week", "comp_wend")

dat_1 <- select_at(dat, .vars = c("ID", vars_model1))
dat_1 <- 
#refactor variables into numeric categories
dat_1 <- dat_1 %>% mutate_at(vars(c(dep_score, text_wend, text_week, tv_wend, tv_week, comp_week, comp_wend)),
                    list(cat = ~case_when(. %in% c("Not at all") ~ 0,
                                          . %in% c("Less than 1 hour") ~ 1,
                                          . %in% c("1-2 hours") ~2,
                                          . %in% c("3 or more hours") ~3,
                                          TRUE ~NA_real_))) %>% 
  select(ID, dep_score, contains("cat"), -dep_score_cat) %>% 
  mutate_at(c("dep_score", "text_wend_cat", "text_week_cat",
              "tv_wend_cat", "tv_week_cat", "comp_week_cat", "comp_wend_cat"),
            funs(factor(.)))

ini <- mice(dat_1, maxit = 0)
meth <- ini$meth
meth

meth[3:8] <- "polyreg"
meth

pred <- ini$pred
pred[, "dep_score"] <- 0
pred[, "ID"] <- 0

imp1 <- mice(dat_1, meth = meth, pred = pred, print = FALSE)

summary(mice::complete(imp1))
summary(dat_1)

pred <- ini$pred
pred[, "ID"] <- 0
pred
imp2 <- mice(dat_1, meth = meth, pred = pred, print = FALSE)

plot(imp1, c("dep_score", "text_wend_cat","text_week_cat", "tv_wend_cat", "tv_week_cat"))
plot(imp2, c("dep_score", "text_wend_cat","text_week_cat", "tv_wend_cat", "tv_week_cat"))

imp3 <- mice.mids(imp2, maxit = 10)

plot(imp3, c("dep_score", "text_wend_cat","text_week_cat", "tv_wend_cat", "tv_week_cat"))

densityplot(imp2, ~text_week_cat)

mice::complete(imp2, 1)[1:15,]

mice.mid
