yarn_weights_clean_func <-
function(data) {
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
top_patterns_clean_func <-
function(data) {
  data %>% 
    select(username, pattern_type.name) %>% 
    count(username, pattern_type.name) %>% 
    arrange(username,desc(n)) %>% 
    group_by(username) %>% 
    top_n(5) %>% 
    ungroup() %>% 
    mutate(common_flag = ifelse(pattern_type.name %in% c("Pullover", "Child", "Hat"), TRUE, FALSE))%>% 
    mutate(username = as.factor(username)) %>% 
    mutate(pattern_type.name = as.factor(pattern_type.name)) %>% 
    mutate(pattern_type.name = reorder_within(pattern_type.name, -n, username))
}
top_authors_clean_func <-
function(data, top_n = 5) {
  top_n_authors_tbl <- data %>%
    unnest(pattern_author.name) %>% 
    count(username, pattern_author.name) %>% 
    arrange(desc(n)) %>% 
    mutate(pattern_author.name = fct_reorder(as_factor(pattern_author.name),n)) %>% 
    group_by(username) %>%
    mutate(row = row_number()) %>% 
    filter(row <= top_n) %>% 
    ungroup() %>% 
    mutate(pattern_author.name = as.factor(pattern_author.name)) %>% 
    mutate(pattern_author.name = reorder_within(pattern_author.name, n, username))%>%
    mutate(author = c("PetiteKnit", "DropsDesign", "Knitatude", "StephenWest", "AndreaMowry", "AndreaMowry", "JustynaLorkowska", "CaitlinHunter", "PerfectlyKnotted", "JojiLocatelli"))
}
