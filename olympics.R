library(tidyverse)
library(askpass)
# Athletes Dataset

athletes <- read.csv("athletes.csv", stringsAsFactors = FALSE)
View(athletes)

print(as_tibble(athletes)) 

print(colnames(athletes)) # get all colnames
print(sapply(athletes, class)) # apply class function (get datatypes of columns) to athletes
print(unique(athletes["disciplines"])) # get unique values in disciplines column

# Filter only for male road cyclists
athletes <- athletes |> 
  select(c(code,name,gender,country,disciplines,events,birth_date,
           nickname,hobbies,occupation,education,family,lang,coach,
           reason,hero,influence,philosophy,ritual, other_sports)) |>
  filter(disciplines == "[\'Cycling Road\']", gender == 'Male')





events <- read.csv("events.csv", stringsAsFactors = FALSE)
medallists <- read.csv("medallists.csv", stringsAsFactors = FALSE)
medals_total <- read.csv("medals_total.csv", stringsAsFactors = FALSE)
medals <- read.csv("medals.csv", stringsAsFactors = FALSE)

medals <- read.csv("medals.csv", stringsAsFactors = FALSE)
View(medals)

# Cycling Road Dataset

cycling_road <- read.csv("cycling_road.csv", stringsAsFactors = FALSE)
View(cycling_road)
print(as_tibble(cycling_road)) 

# Male Road Race and Time Trials
cycling_road <- cycling_road |>
  select(event_name, gender, participant_name, gender, participant_country_code, rank, result, result_type, result_diff) |>
  filter(gender == "M")

#FIX THIS BELOW COMMENTED LINES!!
# want to get mean result diff by country for road race 
cycling_road <- cycling_road |>
  select(participant_country_code, result_diff) |>
  #mutate(result_diff = parse_date_time(result_diff, 'MS')) |>
  group_by(participant_country_code) 
#summarize(mean_result_diff = mean(result_diff))



View(events)

View(medals_total)
