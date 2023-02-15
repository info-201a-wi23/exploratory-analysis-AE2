
#TODO move libraries and dataset loading into main RMD file at the end

#TODO Create separate files for the agg_table and sum_info files for the table and summary info in the RMD

#TODO When creating table of films use top 5 look for the films that have either been nominated or won the most 

#TODO look into changing rotation of bar plot

#TODO charts - sideways bar plot for most films won/nominated y = film names, x = num times nominated/won
#TODO charts - pie chart for race x = %nominations y = race

#TODO charts - line plot with multiple lines where different lines represent different genders or other things. x = ceremony year, y = number of winners by gender

library("ggplot2")
library("plotly")
library("dplyr")
library("openxlsx")

oscars_data <- read.xlsx("oscars.xlsx")



