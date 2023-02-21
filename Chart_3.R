oscars_data <- oscars_data %>%
     mutate(gender = if_else(gender == "female", "Female", gender))

# create a data frame with number of winners by gender and year
gender_data <- oscars_data %>% 
     drop_na(gender, year_ceremony, winner) %>%
     group_by(gender, year_ceremony) %>% 
     summarize(wins = sum(winner)) 

# create a line plot
ggplot(gender_data, aes(x = year_ceremony, y = wins, color = gender)) +
     geom_line() +
     labs(title = "Oscar Winners by Gender per year", x = "Ceremony Year", y = "Number of Winners", color = "Gender") +
     scale_x_continuous(breaks = seq(1920, 2020, 10))
