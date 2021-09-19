## Loads NPC Dispositions

npc_dispositions <-
  readr::read_csv("data-raw/files/NPC Dispositions.csv") %>%
  make_cols_snake_case() %>%
  dplyr::rename(npc_name = name,
                sociability = social_anxiety) %>%
  dplyr::mutate(love_interest =
                  convert_to_na(x = love_interest, value = "null")) %>%
  dplyr::mutate(relationships_temp =
                  strsplit(x = relationships, split = "' ")) %>%
  tidyr::unnest(cols = relationships_temp) %>%
  dplyr::mutate(relationships_temp = gsub(pattern = "'",
                                          replacement = "",
                                          x = relationships_temp)) %>%
  tidyr::separate(col = relationships_temp,
                  into = c("other_npc_name", "relationship"),
                  sep = " ") %>%
  dplyr::select(-relationships) %>%
  dplyr::mutate(other_npc_name = gsub(pattern = " $",
                                      replacement = "",
                                      x = other_npc_name),
                relationship = gsub(pattern = " $|",
                                    replacement = "",
                                    x = relationship)) %>%
  dplyr::mutate(relationship = gsub(pattern = "_",
                                    replacement = " ",
                                    x = relationship)) %>%
  dplyr::mutate(relationship = ifelse(test = relationship == "",
                                      yes = NA,
                                      no = relationship)) %>%
  tidyr::separate(col = start_location,
                  into = c("start_location",
                           "start_location_coord_x",
                           "start_location_coord_y"),
                  sep = " ")

usethis::use_data(npc_dispositions, overwrite = TRUE)
