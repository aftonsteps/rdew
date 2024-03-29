% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{objects}
\alias{objects}
\title{Objects}
\format{
A data frame with 702 rows and 8 variables:
\describe{
  \item{object_id}{Object id of the object}
  \item{name}{Name of the object}
  \item{price}{Price of the object}
  \item{edibility}{Value used to determine health/energy regained by eating the item.
  The energy gained is 2.5 x `edibility`, and the health gained is 1.125 x `edibility`.
  Note that the amount of health shown in the tooltip is only 1 x `edibility` but
  the actual amount gained is 1.125 x `edibility`.}
  \item{category_id}{The category id of the object}
  \item{category_name}{The readable name of the category}
  \item{type}{Type of object object}
  \item{english_name}{The name of the object in English, and a duplicate of
  `name` (may update in the future to include other language names)}
  \item{description}{Description of the food or drink item}
}
}
\source{
Data loaded from \url{https://github.com/aftonsteps/stardewdata} which
in turn depends on \url{https://github.com/LeonBlade/xnbcli} for extracting the data
from the game. Descriptions of the variables summarized from
\url{https://stardewcommunitywiki.com/Modding:Object_data}
}
\usage{
objects
}
\description{
A dataset containing information about various objects found in Stardew
Valley. Certain objects are not contained in this dataset, specifically
crops, foods and drinks, geodes, and rings, which you can find in the
`crops`, `food_and_drinks`, `geodes`, and `rings` datasets.
}
\keyword{datasets}
