race_data <- oscars_data %>% 
     drop_na(Race, winner) %>%
     group_by(Race) %>% 
     summarize(wins = sum(winner)) %>% 
     mutate(percent = wins / sum(wins) * 100) %>% 
     arrange(desc(wins))

# create a pie chart
ggplot(race_data, aes(x = "", y = percent, fill = Race)) +
     geom_bar(width = 1, stat = "identity") +
     coord_polar("y", start = 0) +
     labs(title = "Oscar Wins by Race", fill = "Race") +
     theme_void()