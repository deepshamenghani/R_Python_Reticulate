
# For EDA
library(tidyverse)
library(DT)
library(lubridate)
library(tidyquant)
library(viridis)
library(thematic)
library(tidytext)
library(magick)
library(ggimage)

# For interacting between python and R
library(reticulate)

# For storing any secret keys required by API calls
library(dotenv)

source_python("python_api_functions.py")
source("functions_r.R")

load_dot_env("rav.env")

authUsername = Sys.getenv('authUsername')
authPassword = Sys.getenv('authPassword')

rav_username_input1 <- 'rieslingm'
rav_username_input2 <- 'yarnsandcoffee'

page_sizeinput <- 1500
pagelist <- 1:14

startdate <- date("2020-01-01")
enddate   <- date("2022-05-01")

queue_tbl <- get_queue(authUsername, authPassword, rav_username = rav_username_input1, query = '', page = 1, page_size = page_sizeinput)

fav_tbl <- pagelist %>% 
  map_dfr(~(get_favorites(authUsername, authPassword, rav_username = 'yarnsandcoffee', page = .x) %>% select(id, created_at, favorited.id, favorited.name))) %>% 
  mutate(pattern_id = favorited.id)

projects_tbl <- queue_tbl %>% 
  mutate(username = rav_username_input1) %>% 
  select(username, created_at, pattern_id) %>% 
  rbind(
    fav_tbl %>% 
      mutate(username = rav_username_input2) %>% 
      select(username, created_at, pattern_id)
  )

projects_date_formatted <- projects_tbl %>% 
  mutate(created_at = date(created_at)) %>% 
  mutate(month_year = floor_date(created_at %m-% months(0), 'month')) %>%
  mutate(quarter_year = floor_date(month_year, unit = "quarter")) %>%
  mutate(semester_year = floor_date(month_year, unit = "6 month")) %>% 
  filter(created_at >= startdate & created_at <= enddate) %>% 
  mutate(row = row_number()) 


safer_pattern_details_from_int_pattern_id <- possibly(pattern_details_from_int_pattern_id, otherwise = NULL)
k<-0

project_patterns_details <- projects_date_formatted %>%
  split(.$row) %>%
  map(~safer_pattern_details_from_int_pattern_id(select(.,pattern_id ) %>% pull()))

group_errs = project_patterns_details %>%
  keep(~is.null(.x) ) %>%
  names()

project_patterns_details_compact <- compact(project_patterns_details) %>%
  map(~select(., id, name, pattern_author.name, published, free, difficulty_average, difficulty_count, permalink, favorites_count, projects_count,queued_projects_count, rating_average, rating_count, yardage, yardage_max, yarn_weight_description, craft.name, pattern_author.knitting_pattern_count, pattern_author.crochet_pattern_count, pattern_type.clothing, pattern_type.name, pattern_needle_sizes, yardage_description, pattern_categories, pattern_attributes))

project_patterns_details_reduce <- project_patterns_details_compact %>%
  map(~ mutate(.,published = as.character(published), rating_count = as.list(rating_count), yardage = as.list(yardage), yardage_max = as.list(yardage_max), yarn_weight_description = as.character(yarn_weight_description))) %>%
  reduce(rbind) %>%
  separate(yarn_weight_description,
           into = c("yarn_weight", "wpi"),
           sep = " ",
           remove = TRUE) %>% 
  mutate(yarn_weight_category = case_when(yarn_weight %in% c("Aran", "Worsted") ~ "4-Worsted",
                                          yarn_weight %in% c("DK") ~ "3-DK",
                                          yarn_weight %in% c("Lace", "Light", "Thread") ~ "1-Lace",
                                          yarn_weight %in% c("Fingering") ~ "2-Fingering",
                                          yarn_weight %in% c("Bulky", "Super", "Jumbo") ~ "5-Bulky",
                                          TRUE ~ "Other")) 

projects_queued <- projects_date_formatted %>%
  inner_join(project_patterns_details_reduce %>% 
               select(pattern_id = id, pattern_author = name, everything()) 
  ) %>% 
  distinct() %>% 
  mutate(username = ifelse(username == "rieslingm", "Riesling", "Deepsha"))

saveRDS(projects_queued, "data_cleaned.rds")

yarn_weights_clean_func <- function(data) {
  data %>% 
    filter(yarn_weight_category != "Other") %>% 
    mutate(value = 1) %>% 
    group_by(username, quarter_year, yarn_weight_category) %>%
    summarise(n = sum(value)) %>% 
    ungroup() %>% 
    complete(nesting(username, yarn_weight_category), quarter_year, fill = list(n=0)) %>% 
    group_by(username, quarter_year) %>%
    mutate(percentage = n/sum(n)) %>% 
    ungroup() %>% 
    separate(yarn_weight_category, into = c("yarn_weight", "yarn_category"), sep = "-", remove = FALSE) %>% 
    mutate(yarn_weight = as.integer(yarn_weight)) %>% 
    mutate(yarn_weight_category = fct_reorder(as_factor(yarn_weight_category),-yarn_weight))
}

dump(c("yarn_weights_clean_func"), "data_cleaning_functions.R", append = FALSE)