library(tidyverse)
library(DataExplorer)
library(janitor)
library(naniar)
dat <- read_csv("maps-synthetic-data.csv") %>% rename(ID = X1)

View(dat)
#categorization of data

#Due to small numbers in some of the categories, 
#anxiety and depression at 7, 10 and 13 were dichotomised into
#low (categories 1 and 2) and medium/high (categories 3 to 6); 
#anxiety and depression at 15 were regrouped into low (categories 1 and 2), medium (category 3) and high (categories 4–6).




vars_model1 <- c("dep_score", "text_wend", "text_week", "tv_wend", "tv_week",
          "comp_week", "comp_wend")



vars_model2 <- c("dep_score", "text_wend", "text_week", "tv_wend", "tv_week",
                 "comp_week", "comp_wend", "sex","anx_band_15",
                 "mat_anx_0m","mat_anx_1","mat_anx_18m", "mat_anx_8m",
                 "mat_dep", "mat_edu", "mat_ses")

vars_model3 <- c("dep_score", "text_wend", "text_week", "tv_wend", "tv_week",
                 "comp_week", "comp_wend", "sex","anx_band_15",
                 "mat_anx_0m","mat_anx_1","mat_anx_18m", "mat_anx_8m",
                 "mat_dep", "mat_edu", "mat_ses", "iq", "pat_pres", 
                 "pat_pres_10", "pat_pres_8", "num_home", "phys_cruel", "emot_cruel",
                 "child_bull","fam_tv_aft", "fam_tv_eve", "fam_tv_mor")
  
vars_model4a <- c("dep_score", "text_wend", "text_week", "tv_wend", "tv_week",
                 "comp_week", "comp_wend", "sex","anx_band_15",
                 "mat_anx_0m","mat_anx_1","mat_anx_18m", "mat_anx_8m",
                 "mat_dep", "mat_edu", "mat_ses", "iq", "pat_pres", 
                 "pat_pres_10", "pat_pres_8", "num_home", "phys_cruel", "emot_cruel",
                 "child_bull","fam_tv_aft", "fam_tv_eve", "fam_tv_mor",
                 "alon_week", "alon_wend")

vars_model4b <- c("dep_score", "text_wend", "text_week", "tv_wend", "tv_week",
                  "comp_week", "comp_wend", "sex","anx_band_15",
                  "mat_anx_0m","mat_anx_1","mat_anx_18m", "mat_anx_8m",
                  "mat_dep", "mat_edu", "mat_ses", "iq", "pat_pres", 
                  "pat_pres_10", "pat_pres_8", "num_home", "phys_cruel", "emot_cruel",
                  "child_bull","fam_tv_aft", "fam_tv_eve", "fam_tv_mor",
                  "tran_week","tran_wend")

vars_model4c <- c("dep_score", "text_wend", "text_week", "tv_wend", "tv_week",
                  "comp_week", "comp_wend", "sex","anx_band_15",
                  "mat_anx_0m","mat_anx_1","mat_anx_18m", "mat_anx_8m",
                  "mat_dep", "mat_edu", "mat_ses", "iq", "pat_pres", 
                  "pat_pres_10", "pat_pres_8", "num_home", "phys_cruel", "emot_cruel",
                  "child_bull","fam_tv_aft", "fam_tv_eve", "fam_tv_mor",
                  "out_sum_wend", "out_sum_week")

vars_model4d <- c("dep_score", "text_wend", "text_week", "tv_wend", "tv_week",
                  "comp_week", "comp_wend", "sex","anx_band_15",
                  "mat_anx_0m","mat_anx_1","mat_anx_18m", "mat_anx_8m",
                  "mat_dep", "mat_edu", "mat_ses", "iq", "pat_pres", 
                  "pat_pres_10", "pat_pres_8", "num_home", "phys_cruel", "emot_cruel",
                  "child_bull","fam_tv_aft", "fam_tv_eve", "fam_tv_mor",
                  "out_win_wend", "out_win_week")

vars_model4e <- c("dep_score", "text_wend", "text_week", "tv_wend", "tv_week",
                  "comp_week", "comp_wend", "sex","anx_band_15",
                  "mat_anx_0m","mat_anx_1","mat_anx_18m", "mat_anx_8m",
                  "mat_dep", "mat_edu", "mat_ses", "iq", "pat_pres", 
                  "pat_pres_10", "pat_pres_8", "num_home", "phys_cruel", "emot_cruel",
                  "child_bull","fam_tv_aft", "fam_tv_eve", "fam_tv_mor",
                  "play_week", "play_wend")

vars_model4f <- c("dep_score", "text_wend", "text_week", "tv_wend", "tv_week",
                  "comp_week", "comp_wend", "sex","anx_band_15",
                  "mat_anx_0m","mat_anx_1","mat_anx_18m", "mat_anx_8m",
                  "mat_dep", "mat_edu", "mat_ses", "iq", "pat_pres", 
                  "pat_pres_10", "pat_pres_8", "num_home", "phys_cruel", "emot_cruel",
                  "child_bull","fam_tv_aft", "fam_tv_eve", "fam_tv_mor",
                  "draw_week", "draw_wend")

vars_model4g <- c("dep_score", "text_wend", "text_week", "tv_wend", "tv_week",
                  "comp_week", "comp_wend", "sex","anx_band_15",
                  "mat_anx_0m","mat_anx_1","mat_anx_18m", "mat_anx_8m",
                  "mat_dep", "mat_edu", "mat_ses", "iq", "pat_pres", 
                  "pat_pres_10", "pat_pres_8", "num_home", "phys_cruel", "emot_cruel",
                  "child_bull","fam_tv_aft", "fam_tv_eve", "fam_tv_mor",
                  "exercise")

vars_model4h <- c("dep_score", "text_wend", "text_week", "tv_wend", "tv_week",
                  "comp_week", "comp_wend", "sex","anx_band_15",
                  "mat_anx_0m","mat_anx_1","mat_anx_18m", "mat_anx_8m",
                  "mat_dep", "mat_edu", "mat_ses", "iq", "pat_pres", 
                  "pat_pres_10", "pat_pres_8", "num_home", "phys_cruel", "emot_cruel",
                  "child_bull","fam_tv_aft", "fam_tv_eve", "fam_tv_mor",
                  "work_wend", "work_week")

vars_model4i <- c("dep_score", "text_wend", "text_week", "tv_wend", "tv_week",
                  "comp_week", "comp_wend", "sex","anx_band_15",
                  "mat_anx_0m","mat_anx_1","mat_anx_18m", "mat_anx_8m",
                  "mat_dep", "mat_edu", "mat_ses", "iq", "pat_pres", 
                  "pat_pres_10", "pat_pres_8", "num_home", "phys_cruel", "emot_cruel",
                  "child_bull","fam_tv_aft", "fam_tv_eve", "fam_tv_mor",
                  "read_wend", "read_week")

vars_model4j <- c("dep_score", "text_wend", "text_week", "tv_wend", "tv_week",
                  "comp_week", "comp_wend", "sex","anx_band_15",
                  "mat_anx_0m","mat_anx_1","mat_anx_18m", "mat_anx_8m",
                  "mat_dep", "mat_edu", "mat_ses", "iq", "pat_pres", 
                  "pat_pres_10", "pat_pres_8", "num_home", "phys_cruel", "emot_cruel",
                  "child_bull","fam_tv_aft", "fam_tv_eve", "fam_tv_mor",
                  "musi_wend", "musi_week")

vars_model4k <- c("dep_score", "text_wend", "text_week", "tv_wend", "tv_week",
                  "comp_week", "comp_wend", "sex","anx_band_15",
                  "mat_anx_0m","mat_anx_1","mat_anx_18m", "mat_anx_8m",
                  "mat_dep", "mat_edu", "mat_ses", "iq", "pat_pres", 
                  "pat_pres_10", "pat_pres_8", "num_home", "phys_cruel", "emot_cruel",
                  "child_bull","fam_tv_aft", "fam_tv_eve", "fam_tv_mor",
                  "talk_mob_week", "talk_mob_wend")


vars_model4l <- c("dep_score", "text_wend", "text_week", "tv_wend", "tv_week",
                  "comp_week", "comp_wend", "sex","anx_band_15",
                  "mat_anx_0m","mat_anx_1","mat_anx_18m", "mat_anx_8m",
                  "mat_dep", "mat_edu", "mat_ses", "iq", "pat_pres", 
                  "pat_pres_10", "pat_pres_8", "num_home", "phys_cruel", "emot_cruel",
                  "child_bull","fam_tv_aft", "fam_tv_eve", "fam_tv_mor",
                  "talk_phon_week", "talk_phon_wend")


filter.NA.fun <- function(df, var){ 
  
  var <- enquo(var)
  
 count <-  df %>% 
    select(one_of(!!var)) %>%
    filter_all(all_vars(!is.na(.))) %>% 
    summarise(count = n()) 
    
  } 

all_model_vars <- list(vars_model1 = vars_model1, vars_model2 = vars_model2,
                       vars_model3 = vars_model3,  vars_model4a = vars_model4a,
                       vars_model4b = vars_model4b, vars_model4c = vars_model4c, vars_model4d = vars_model4d,
                       vars_model4e = vars_model4e, vars_model4f = vars_model4f,
                       vars_model4g = vars_model4g, vars_model4h = vars_model4h,
                       vars_model4i = vars_model4i, vars_model4j = vars_model4j,
                       vars_model4k = vars_model4k, vars_model4l = vars_model4l)

map_df(all_model_vars, filter.NA.fun, df = dat) %>% add_column(model = names(all_model_vars))

#Participants (n = 14,665; complete cases n = 1869)

#4,562 completed CIS-R at age 18
#3,009 with exposure information at 16
#1,869 with complete covariate information

# secondary diagnosis = Secondary diagnosis was determined using the CIS-R. 0 = none, 1 = mild neurosis, 2 = mild GAD, 3 = OCD, 4 = mixed anxiety and depression, 5 = specific phobia, 6 = social phobia, 7 = agoraphobia, 8 = GAD, 9 = panic disorder, 10 = mild depression, 11 = moderate depression, 12 = severe depression
# primary diagnosis = Primary diagnosis was determined using the CIS-R. 0 = none, 1 = mild neurosis, 2 = mild GAD, 3 = OCD, 4 = mixed anxiety and depression, 5 = specific phobia, 6 = social phobia, 7 = agoraphobia, 8 = GAD, 9 = panic disorder, 10 = mild depression, 11 = moderate depression, 12 = severe depression
# panic score = Higher scores indicate higher levels of panic symptomatology. They were scored following: +1 if panic occurred once in past week, +1 if panic occurred more than once in past week, +1 if panic attack lasted longer than 10 mins, +1 if panic attack was very unpleasant. See CIS-R Descriptive Summary for details.
# depression score = Higher scores indicate higher levels of depressive symptomatology.  They were scored following: +1 if less/no enjoyment with life during the past week, +1 if depressed for >3day in past week, +1 if depressed for >3hr in any day of past week, +1 if unable to be cheered up. See CIS-R Descriptive Summary for details.
# comp_wend / week = How much time on average do you spend each day ... using a computer ... on a typical weekday / weekend?
# Computer_Int_Room = computer with internet in childs room / study
# Comp_house_noint= computer with no internet is in the house
# Depressed_thoughts= Child's number of depressive thoughts on CIS-R. Higher scores indicate higher levels of depressive thoughts. There were scored following: +1 if feelings of needless guilt, +1 if feelings of low self-esteem, +1 if feelings of hopelessness, +1 if felt that life not worth living, +1 if thought seriously about suicide. See CIS-R Descriptive Summary for details.
# Dep_band15 = Child has depression (DAWBA band prediction) Depression was determined using the DAWBA. The child completed the computerised questions and an ordered categorical measure of depression with 6 categories was derived using computer algorithms. The categories are probability bands and indicate the likelihood of the child having depression. The categories range from <0.1% (0.1% children in this band have depression) to > 70% (>70% of children in this band have depression). See Goodman2011 for more details.
# time alone weekday/end = "How much time on average do you spend each day doing things by yourself on a typical weekday?"
# ICD_Depression_Diagnosis = Calculated from their Revised Computerised Interview Schedule (CIS-R) score. See CIS-R Descriptive Summary for more information.

# variables identified in the imputation as "important":


dat %>% select(one_of(vars_model1)) %>% naniar::vis_miss()


dat %>% select(one_of(vars_model1)) %>% naniar::gg_miss_upset()

dat %>% select(one_of(c(vars_model1, "mat_ses"))) %>%
  naniar::gg_miss_var(show_pct = TRUE, facet = mat_ses)

dat %>% select(one_of(c(vars_model1, "pat_ses"))) %>%
  naniar::gg_miss_var(show_pct = TRUE, facet = pat_ses)

dat$mat_ses
dat %>% group_by(sex) %>% summarise(count = n())
gg_miss_var()

dat %>% visdat::vis_dat()
dat %>% naniar::gg_miss_upset()
dat %>% naniar::gg_miss_upset(nsets = n_var_miss(riskfactors))
dat %>% naniar::gg_miss_var(show_pct = TRUE, facet = sex)
dat %>% naniar::miss_var_span(ICD_Depression_Diagnosis_17.5, span_every = 3000)
dat %>% naniar::gg_miss_span(ICD_Depression_Diagnosis_17.5, span_every = 1000) + 
  labs(title = "Number of missing ICD Depression Diagnosis")

dat %>% naniar::gg_miss_var(show_pct = TRUE, facet = "comp_games")


dat$comp_games

