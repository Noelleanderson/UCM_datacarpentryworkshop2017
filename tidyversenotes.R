## Cmd + Shift + M if you have a Mac for the %>% pipe
## option - gives arrow <- 
## option arrrow keys skip between words
install.packages("tidyverse")

select(surveys, plot_id, species_id, weight)

filter(surveys, year == 1995)



## Using pipes, subset the survey data to include individuals collected before 
## 1995 and retain only the columns year, sex, and weight.

surveys_sml <- surveys %>% 
  filter(year == 1995) %>% 
  select(plot_id, species_id, weight, year)


surveys %>%
  mutate(weight_kg = weight / 1000)

surveys %>%
  mutate(weight_kg = weight / 1000,
         weight_kg2 = weight_kg * 2)

## Create a new data frame from the surveys data that meets the following criteria: 
## contains only the species_id column and a new column called  hindfoot_half containing 
## values that are half the hindfoot_length values. In this hindfoot_half column, 
## there are no NAs and all values are less than 30.

surveys %>% 
  mutate(hindfoot_half = hindfoot_length / 2) %>% 
  filter(hindfoot_half < 30 | is.na(hindfoot_half) == FALSE) %>% 
  select(species_id, hindfoot_half)
