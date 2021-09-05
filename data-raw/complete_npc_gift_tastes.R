## Creates complete NPC Gift Tastes
## Requires NPC Gift Tastes and Universal Gift Tastes datasets

source("data-raw/npc_gift_tastes.R")
source("data-raw/universal_gift_tastes.R")

add_universal_gift_tastes <- function(npc, gift_tastes, universal_tastes) {
  gift_tastes <-
    gift_tastes %>%
    dplyr::filter(name == npc)

  gift_tastes_dialogue <-
    gift_tastes %>%
    dplyr::select(dialogue_type, dialogue, item_type) %>%
    dplyr::distinct()

  universal_tastes <-
    universal_tastes %>%
    dplyr::filter(! object_id %in% gift_tastes$object_id) %>%
    dplyr::mutate(name = npc) %>%
    dplyr::left_join(gift_tastes_dialogue, by = "item_type") %>%
    dplyr::full_join(gift_tastes,
                     by = c("name",
                            "object_id",
                            "dialogue_type",
                            "dialogue",
                            "item_type"))

  return(universal_tastes)
}

complete_npc_gift_tastes_prep <-
  universal_gift_tastes %>%
  make_cols_snake_case() %>%
  dplyr::mutate(item_type = ifelse(test = universal_type == "Neutral",
                                   yes = universal_type,
                                   no = paste0(universal_type, "d"))) %>%
  dplyr::mutate(item_type = paste0(tolower(item_type), "_items")) %>%
  dplyr::select(-universal_type) %>%
  dplyr::mutate(is_universal_gift = TRUE)

complete_npc_gift_tastes <-
  lapply(X = unique(npc_gift_tastes$name),
         FUN = add_universal_gift_tastes,
         gift_tastes = npc_gift_tastes,
         universal_tastes = complete_npc_gift_tastes_prep) %>%
  purrr::reduce(rbind) %>%
  dplyr::mutate(is_universal_gift =
                  tidyr::replace_na(is_universal_gift, FALSE)) %>%
  dplyr::select(name,
                dialogue_type,
                dialogue,
                item_type,
                object_id,
                is_universal_gift) %>%
  dplyr::arrange(name, item_type, object_id)

usethis::use_data(complete_npc_gift_tastes, overwrite = TRUE)

