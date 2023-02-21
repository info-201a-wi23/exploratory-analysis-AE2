#rm(list = ls())
#TODO move libraries and dataset loading into main RMD file at the end

#TODO Create separate files for the agg_table and sum_info files for the table and summary info in the RMD

#TODO When creating table of films use top 5 look for the films that have either been nominated or won the most 


#library("plotly")
#library("dplyr")
#library("openxlsx")
#library(tidyverse)

#oscars_data <- read.xlsx("oscars.xlsx")

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







