library(tidyverse)
library(DataExplorer)

synth_dat <- read_csv("maps-synthetic-data.csv", col)
synth_dat <- synth_dat %>% rename(ID = X1)

glimpse(synth_dat)

introduce(synth_dat)
plot_intro(synth_dat)
plot_missing(synth_dat)

plot_histogram(synth_dat)

qq_dat <- synth_dat %>% select(comp_wend, comp_week, iq)

plot_qq(qq_dat, sampled_rows = 1000)

plot_correlation(qq_dat)