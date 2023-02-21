rm(list = ls())
#TODO move libraries and dataset loading into main RMD file at the end

#TODO Create separate files for the agg_table and sum_info files for the table and summary info in the RMD

#TODO When creating table of films use top 5 look for the films that have either been nominated or won the most 

# load packages
library("ggplot2")
library("plotly")
library("dplyr")
library("openxlsx")
library(tidyverse)

oscars_data <- read.xlsx("oscars.xlsx")

race_data <- oscars_data %>% 
     drop_na(Race, winner) %>%
     group_by(Race) %>% 
     summarize(wins = sum(winner)) %>% 
     mutate(percent = wins / sum(wins) * 100) %>% 
     arrange(desc(wins))

# create a pie chart
chart_2 <- ggplot(race_data, aes(x = "", y = percent, fill = Race)) +
     geom_bar(width = 1, stat = "identity") +
     coord_polar("y", start = 0) +
     labs(title = "Oscar Wins by Race", fill = "Race") +
     theme_void()