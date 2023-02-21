# library(dplyr)

# Load Oscars dataframe into variable oscars_data
# oscars_data <- read.xlsx("oscars.xlsx")

# Get the following values for our report:
# - number of ceremonies in the data set
# - number of unique films in the data set
# - person with the most nominations
# - race that shows up the most in the data set
# - percentage of the most common race


num_ceremonies <- n_distinct(oscars_data$year_ceremony)
num_films <- n_distinct(oscars_data$film)
most_nominated_person <- oscars_data %>%
     count(name) %>%
     filter(n == max(n)) %>%
     pull(name)
most_common_race <- names(which.max(table(oscars_data$Race)))
percent_most_common_race <- round(max(table(oscars_data$Race))/sum(table(oscars_data$Race)) * 100)