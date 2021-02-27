expand_npc_relationships <- function() {
  ## First split each cell of npc$dispositions$relationships
  ## into a space-separated vector
  ## Loop and get
      ## odd elements to a colnames vector
      ## even elements to a value vector
  ## Populate data.frame with values
  raw_rels <- rstardew::npc_dispositions$relationships
  parsed_rels <- stringr::str_split(string = raw_rels,
                                    pattern = " ")

  npc_names <- c()
  npc_rels <- c()
  for (l_idx in 1:length(parsed_rels)) {
    for (elem_idx in 1:length(parsed_rels[[l_idx]])) {
      if (! is.na(parsed_rels[[l_idx]][elem_idx])) {
        if (elem_idx %% 2 == 1) {
          npc_names <- c(npc_names, parsed_rels[[l_idx]][elem_idx])
        } else {
          npc_rels <- c(npc_rels, parsed_rels[[l_idx]][elem_idx])
        }
      }
    }
  }
}
