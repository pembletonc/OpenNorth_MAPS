library(tidyverse)
library(DataExplorer)
library(janitor)

synth_dat <- read_csv("maps-synthetic-data.csv")
synth_dat <- synth_dat %>% rename(ID = X1)

#Participants (n = 14,665; complete cases n = 1869)

glimpse(synth_dat)


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

synth_dat %>% select(ID, sex, 
                     Secondary_Depression_Diagnosis_17.5 = secd_diag,
                     Primary_Depression_Diagnosis_17.5 = prim_diag,
                     ICD_Depression_Diagnosis_17.5 = has_dep_diag,
                     Depression_Score_17.5 = dep_score,
                     Depression_Band_15.5 = dep_band_15,
                     Panic_Score_17.5 = panic_score,
                     Depressed_Thoughts_17.5 = dep_thoughts,
                     Computer_Weekday_Use_16.5 = comp_week,
                     Computer_Weekend_Use_16.5 = comp_wend,
                     Computer_No_Int_House_14 = comp_house,
                     Computer_Int_Room_14 = comp_int_bed_16,
                     Computer_No_Int_Room_14 = comp_noint_bed_16,
                     Bullying_16.5 = child_bull,
                     Time_Alone_Weekday_16.5 = alon_week,
                     Time_Alone_Weekend_16.5 = alon_wend) %>% View()





