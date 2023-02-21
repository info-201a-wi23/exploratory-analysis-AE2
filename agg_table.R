
#rm(list = ls())
#TODO move libraries and dataset loading into main RMD file at the end

#TODO Create separate files for the agg_table and sum_info files for the table and summary info in the RMD

#TODO When creating table of films use top 5 look for the films that have either been nominated or won the most 


# Subset the `oscars_data` dataframe for our table.
# We want to show the top 5 films that have been nominated the most:
agg_table <- oscars_data %>% 
     filter(!is.na(film)) %>% 
     group_by(film) %>% 
     summarize(nominations = n()) %>% 
     arrange(desc(nominations)) %>% 
     slice_head(n = 5)
