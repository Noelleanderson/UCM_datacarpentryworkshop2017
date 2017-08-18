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
  filter(hindfoot_half < 30, !is.na(hindfoot_half)) %>% 
  select(species_id, hindfoot_half) 

surveys %>%
  group_by(sex) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))

surveys %>%
  group_by(sex, species_id) %>% ## filter on 2 cols
  summarize(mean_weight = mean(weight, na.rm = TRUE)) %>% 
  head 

surveys %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight)) %>%
  print(n = 50)

surveys %>%
  group_by(sex) %>%
  tally

## 1. How many individuals were caught in each plot_type surveyed?
surveys %>% 
  group_by(plot_type) %>% 
  select(species_id, plot_type) %>% 
  tally

## 2. Use group_by() and summarize() to find the mean, min, and max hindfoot length 
## for each species (using species_id).
surveys %>% 
  group_by(species) %>%
  filter(!is.na(hindfoot_length)) %>% 
  summarise(meanHL = mean(hindfoot_length), minHL = min(hindfoot_length), maxHL = max(hindfoot_length)) %>% 
  tail

## 3. What was the heaviest animal measured in each year? Return the columns year, genus, 
## species_id, and weight.
surveys %>% 
 # filter(!is.na(weight)) %>% 
  group_by(year) %>% 
  filter(weight == max(weight, na.rm = T)) %>% 
  select(year, genus, species_id, weight) %>% 
  arrange(year)

## top_n(1, weight)
  
surveys %>% 
  group_by(year) %>% 
  filter(!is.na(weight), weight == max(weight)) %>% # THIS SHOULD WORK FOR ABOVE BUT DOESN'T
  select(year, genus, species_id, weight)

## 4. You saw above how to count the number of individuals of each sex using a combination 
## of group_by() and tally(). 
surveys %>% 
  group_by(sex) %>% 
  tally

## How could you get the same result using group_by() and summarize()? Hint: see ?n.
surveys %>% 
  group_by(sex) %>% 
  summarize(numb = n())
