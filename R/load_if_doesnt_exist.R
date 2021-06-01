load_if_doesnt_exist <- function(data) {
  if (!exists(data)) {
    source(paste0("data-raw/", data, ".R"))
  }
}
