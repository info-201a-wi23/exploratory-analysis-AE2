films_data <- oscars_data %>% 
     drop_na(film, winner) %>% 
     group_by(film) %>% 
     summarize(wins = sum(winner, na.rm = TRUE)) %>% 
     arrange(desc(wins)) %>% 
     top_n(5)


chart1 <- ggplot(data = films_data) +
     geom_col(mapping = aes(
          x = reorder(film, wins),
          y = wins,
          fill = film
     )) +
     labs(
          title = "Films with most Oscar wins",
          x = "film",
          y = "wins"
     ) +
     coord_flip() +
     theme(legend.position = "none")
chart1







