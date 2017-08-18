##

ggplot(surveys_complete, aes(weight, hindfoot_length)) + geom_point(alpha = 0.1, aes(color = species_id))ggplot(surveys_complete, aes(weight, hindfoot_length)) + geom_point(alpha = 0.1, aes(color = species_id))

ggplot(surveys_complete, aes(species_id, weight)) + 
  geom_boxplot(aes(color=plot_type)) 

ggplot(surveys_complete, aes(species_id, weight)) + 
  geom_boxplot(aes(color=plot_type)) + 
  facet_grid(sex ~ .) + ## VERY COOL
  labs(x = "species", y = "weight") ## has to have x= and y=
## GRID USED WHEN NEED TO BREAK DATA OUT BY X AND Y

## Time series

yearly_counts <- surveys_complete %>% 
  group_by(year, species_id) %>% 
  tally

head(yearly_counts)

ggplot(yearly_counts, aes(x = year, y = n, group = species_id, color=species_id)) + 
  geom_line()

ggplot(yearly_counts, aes(x = year, y = n, group = species_id, color=species_id)) + 
  geom_line() + facet_wrap( ~ species_id)
# WRAP USED TO MAKE INDIVIDUAL PLOTS BROKEN UP BY SPECIES 


yearly_sex_counts <- surveys_complete %>% 
  group_by(year, species_id, sex) %>% 
  tally

ggplot(yearly_sex_counts, aes(x = year, y = n, group = species_id, color=sex)) + 
  geom_line() + 
  facet_wrap( ~ species_id)

## how average weight of each species changes over time

yearly_avg_weight <- surveys_complete %>% 
  group_by(species_id, year) %>% 
  summarize(avgweight = mean(weight))

ggplot(yearly_avg_weight, aes(year, avgweight, color = species_id)) +
  geom_line() +
  facet_wrap((~ species_id)) +
  theme_void() +
  theme(axis.text.x = element_text(angle = 90), legend.position = "none")

surveys_complete <- unite(surveys_complete, fullname, genus, species, sep =" ", remove = F)

speciesnames <- surveys_complete %>% 
  groupby(species_id)
