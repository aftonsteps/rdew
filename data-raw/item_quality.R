## Makes a quality dataset for reference

item_quality <-
  data.frame(value = seq(0, 3),
             quality = c("Basic", "Silver", "Gold", "Iridium"))

usethis::use_data(item_quality, overwrite = TRUE)
