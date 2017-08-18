##

ggplot(surveys_complete, aes(weight, hindfoot_length)) + geom_point(alpha = 0.1, aes(color = species_id))ggplot(surveys_complete, aes(weight, hindfoot_length)) + geom_point(alpha = 0.1, aes(color = species_id))

ggplot(surveys_complete, aes(species_id, weight)) + 
  geom_boxplot(aes(color=plot_type)) 

ggplot(surveys_complete, aes(species_id, weight)) + 
  geom_boxplot(aes(color=plot_type)) + 
  facet_grid(sex ~ .) + ## VERY COOL
  labs(x = "species", y = "weight") ## has to have x= and y=

