## TODO's
## TODO figure out what the fishing locations in the locations dataset
## mean by decompiling the game code
## TODO add a convenience dataset for mapping these location numbers to
## a human readable name
## TODO missing object items: rings, food & drink, geodes, basic other
## TODO furniture NA's are incorrect -- -1 actually corresponds to default values
## that can be gotten in Furniture.cs::getDefaultSourceRectForType() and
## Furniture.cs::getDefaultBoundingBoxForType()
## TODO missing crafting recipes dataset (rename recipes to cooking recipes)
## TODO create a category reference table
## TODO split roomid and sprite in bundles
## TODO get rid of the "unused" columns
## TODO there is a mistake in the bundles where only the first required
## item is showing up, not the entire space-delimited list. It's actually
## a space-delimited set of triples, with the first as an ID, the second as
## a
## TODO Add convenience function to make recipes wide?
## TODO figure out how to send convert_to_na as a tidy style function
## TODO add a convenience function for NPC dispositions for
## one-hot encoding relationships
## TODO remove the caught fish locations because it's not used

## RESEARCH TODO's:
## TODO: Remember to update links to the wiki in the documentation once
## ownership is transferred to ConcernedApe
## TODO write vignettes
## Example: introduction to the package
## TODO write documentation
