
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

# load oscars data
oscars_data <- read.xlsx("oscars.xlsx")

# mutate oscars dataframe to sort by winner gender
oscars_data <- oscars_data %>%
     mutate(gender = if_else(gender == "female", "Female", gender))

# create a data frame with number of winners by gender and year
gender_data <- oscars_data %>% 
     drop_na(gender, year_ceremony, winner) %>%
     group_by(gender, year_ceremony) %>% 
     summarize(wins = sum(winner)) 

# create a line plot
chart_3 <- ggplot(gender_data, aes(x = year_ceremony, y = wins, color = gender)) +
     geom_line() +
     labs(title = "Oscar Winners by Gender per year", x = "Ceremony Year", y = "Number of Winners", color = "Gender") +
     scale_x_continuous(breaks = seq(1920, 2020, 10))
