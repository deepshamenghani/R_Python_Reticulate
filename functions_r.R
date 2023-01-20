# The below function takes the pattern number and calls the python function to get pattern details

pattern_details_from_int_pattern_id <- function(z) {
  zid = paste0("",z,"")
  # assign("k", k+1, envir = .GlobalEnv)
  # print(k)
  # print(zid) # removeitlater
  get_pattern_details(authUsername, authPassword, pattern_id = zid)
}

