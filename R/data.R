#' Animals Dataset
#'
#' A dataset containing information about achievements in Stardew Valley.
#' Achievements are in-game events or tasks which, when completed, make a new
#' hat available for purchase in the hat shop.
#'
#' @format A data frame with 30 rows and 6 variables:
#' \describe{
#'   \item{id}{the achievement id}
#'   \item{name}{the name of the achievement}
#'   \item{description}{a longer description of the achievement}
#'   \item{display_on_collections_tab_before_earned}{?}
#'   \item{prerequisite_achievement}{achievement that must be completed first}
#'   \item{hat_earned}{the id of the hat earned by the achievement, which can
#'   be joined to the column `object_id` in the `hats` dataset}
#' }
#' @source Data loaded from \url{https://github.com/aftonsteps/stardewdata} which
#' in turn depends on \url{https://github.com/LeonBlade/xnbcli} for extracting the data
#' from the game. Descriptions of the variables summarized from
#' \url{https://stardewcommunitywiki.com/Modding:Hat_data}
"achievements"

#' Animals Dataset
#'
#' A dataset containing information about animals in Stardew Valley.
#'
#' @format A data frame with 15 rows and 27 variables:
#' \describe{
#'   \item{name}{animal name}
#'   \item{days_to_produce}{days to produce item e.g. milk or egg}
#'   \item{age_when_mature}{days to achieve maturity}
#'   \item{default_produce_index}{object id of regular quality item produced}
#'   \item{deluxe_produce_index}{object id of deluxe quality item produced}
#'   \item{sound}{sound the animal makes}
#'   \item{bounding_box_front_x}{x coordinate of the front-view bounding box}
#'   \item{bounding_box_front_y}{y coordinate of the front-view bounding box}
#'   \item{bounding_box_front_width}{width of front-view bounding box}
#'   \item{bounding_box_front_height}{height of front-view bounding box}
#'   \item{bounding_box_side_x}{x coordinate of the side-view bounding box}
#'   \item{bounding_box_side_y}{y coordinate of the side-view bounding box}
#'   \item{bounding_box_side_width}{width of side-view bounding box}
#'   \item{bounding_box_side_height}{height of side-view bounding box}
#'   \item{harvest_type}{method of harvesting}
#'   \item{change_texture_when_item_ready}{does the animal's coat change texture
#'   when it is ready for harvest?}
#'   \item{building_type}{type of building the animal lives in}
#'   \item{sprite_size_front_width}{front-view width of the sprite}
#'   \item{sprite_size_front_height}{front-view height of the sprite}
#'   \item{sprite_size_side_width}{side-view width of the sprite}
#'   \item{sprite_size_side_height}{side-view height of the sprite}
#'   \item{fullness_drain}{rate of decay after feeding}
#'   \item{happiness_drain}{rate of decay after saying hello}
#'   \item{meat_index}{object id of the meat if the animal is butchered}
#'   \item{sell_price}{sell price of the meat if the animal is butchered}
#'   \item{english_display_type}{English-language name for the animal}
#'   \item{english_display_building}{English-langauge name for the building}
#' }
#' @source Data loaded from \url{https://github.com/aftonsteps/stardewdata} which
#' in turn depends on \url{https://github.com/LeonBlade/xnbcli} for extracting the data
#' from the game. Descriptions of the variables summarized from
#' \url{https://stardewcommunitywiki.com/Modding:Animal_data}
"animals"

#' Animal Blueprints
#'
#' A dataset containing "blueprints" for purchasing animals.
#'
#' @format A data frame with 7 rows and 9 variables:
#' \describe{
#'   \item{name}{animal name}
#'   \item{is_animal}{always 'animal', and only included here in case of future game
#'   updates}
#'   \item{price}{price to purchase the animal}
#'   \item{source_rectangle_for_menu_view_x}{x-coordinate of the menu
#'   rectangle}
#'   \item{source_rectangle_for_menu_view_y}{y-coordinate of the menu
#'   rectangle}
#'   \item{english_name}{the name of the object in English, and a duplicate of
#'   `name` (may update in the future to include other language names)}
#'   \item{description}{description of the animal}
#'   \item{null}{currently always null, and only included here in case of future
#'   game updates}
#'   \item{is_farm}{currently always 'Farm' and only included here in case of
#'   future game updates}
#'   \item{bounding_box_front_height}{height of front-view bounding box}
#'   \item{bounding_box_side_x}{x coordinate of the side-view bounding box}
#'   \item{bounding_box_side_y}{y coordinate of the side-view bounding box}
#'   \item{bounding_box_side_width}{width of side-view bounding box}
#'   \item{bounding_box_side_height}{height of side-view bounding box}
#'   \item{harvest_type}{method of harvesting}
#'   \item{change_texture_when_item_ready}{does the animal's coat change texture
#'   when it is ready for harvest?}
#'   \item{building_type}{type of building the animal lives in}
#'   \item{sprite_size_front_width}{front-view width of the sprite}
#'   \item{sprite_size_front_height}{front-view height of the sprite}
#'   \item{sprite_size_side_width}{side-view width of the sprite}
#'   \item{sprite_size_side_height}{side-view height of the sprite}
#'   \item{fullness_drain}{rate of decay after feeding}
#'   \item{happiness_drain}{rate of decay after saying hello}
#'   \item{meat_index}{object id of the meat if the animal is butchered}
#'   \item{sell_price}{sell price of the meat if the animal is butchered}
#'   \item{english_display_type}{English-language name for the animal}
#'   \item{english_display_building}{English-langauge name for the building}
#' }
#' @source Data loaded from \url{https://github.com/aftonsteps/stardewdata} which
#' in turn depends on \url{https://github.com/LeonBlade/xnbcli} for extracting the data
#' from the game. Descriptions of the variables summarized from
#' \url{https://stardewcommunitywiki.com/Modding:Animal_data}
"animal_blueprints"

#' Big Craftables Data
#'
#' A dataset containing information about big craftables items in the game
#' Stardew Valley. Note that some of these are not implemented in the game, and
#' are instead stored in some type of Object Information dataset or in the
#' Furniture dataset.
#'
#' @format A data frame with 147 rows and 11 variables:
#' \describe{
#'   \item{objectid}{unique id of the object}
#'   \item{name}{name of the item in English}
#'   \item{price}{sale price of the item}
#'   \item{edibility}{health points from eating the item, limited in this
#'   dataset to -300 which is a placeholder for inedible items}
#'   \item{type}{type of item, limited to "Crafting" for this dataset}
#'   \item{category}{category of the item, limited in this dataset to -9 which
#'   represents a "big craftable" category}
#'   \item{description}{description of the item}
#'   \item{can_be_set_outdoors}{boolean representing if the item can be set
#'   outdoors}
#'   \item{can_be_set_indoors}{boolean representing if the item can be set
#'   indoors}
#'   \item{fragility}{frability of the item in value between 0 and 2 (will
#'   update with more information about what these values represent)}
#'   \item{english_name}{the name of the object in English, and a duplicate of
#'   `name` (may update in the future to include other language names)}
#' }
#' @source Data loaded from \url{https://github.com/aftonsteps/stardewdata} which
#' in turn depends on \url{https://github.com/LeonBlade/xnbcli} for extracting the data
#' from the game.
#' Descriptions of the variables summarized from \url{https://stardewvalleywiki.com/Modding:Big_craftables_data}
"big_craftables"

#' Building Blueprints Data
#'
#' A dataset containing information about blueprints for buildings you can
#' purchase or construct.
#'
#' @format A data frame with 25 rows and 20 variables:
#' \describe{
#'   \item{name}{the name of the building}
#'   \item{items_required}{a space-delimited string containing the object
#'   ids of the items required to construct the building, if any}
#'   \item{tiles_width}{width of the building in game tiles}
#'   \item{tiles_height}{height of the building in game tiles}
#'   \item{human_door_x_coord}{x-coordinate of the door that players enter
#'   through}
#'   \item{human_door_y_coord}{y-coordinate of the door that players enter
#'   through}
#'   \item{animal_door_x_coord}{x-coordinate of the door that animals enter
#'   through}
#'   \item{animal_door_y_coord}{y-coordinate of the door that animals enter
#'   through}
#'   \item{map_to_warp_to}{the map image the game uses for the interior of
#'   the building, if any}
#'   \item{english_name}{the name of the object in English, and a duplicate of
#'   `name` (may update in the future to include other language names)}
#'   \item{description}{a description of the building}
#'   \item{blueprint_type}{whether a building is an initial building or
#'   an upgraded version of a previous building}
#'   \item{name_of_building_to_upgrade}{if building type is 'upgrade', then the
#'   name of the building to upgrade}
#'   \item{source_rectangle_for_menu_view_1}{x-coordinate of the menu view
#'   rectangle}
#'   \item{source_rectangle_for_menu_view_y}{y-coordinate of the menu view
#'   rectangle}
#'   \item{max_occupants}{maximum number of occupants}
#'   \item{action_behavior}{action the building provides, if any}
#'   \item{names_of_building_location}{where the building is located}
#'   \item{price}{cost of having the building constructed}
#'   \item{magical}{is the building magical?}
#' }
#' @source Data loaded from \url{https://github.com/aftonsteps/stardewdata} which
#' in turn depends on \url{https://github.com/LeonBlade/xnbcli} for extracting the data
#' from the game.
#' Descriptions of the variables summarized from \url{https://stardewvalleywiki.com/Modding:Big_craftables_data}
"building_blueprints"

#' Bundles Data
#'
#' A dataset containing information about the bundles delivered to the Community
#' Center.
#'
#' @format A data frame with 31 rows and 10 variables:
#' \describe{
#'   \item{room_id}{Name of the room which combined with sprite_index will
#'   uniquely identify each row (each room has multiple bundles)}
#'   \item{sprite_index}{The index of the sprite used for the bundle image}
#'   \item{bundle_name}{the name of the bundle}
#'   \item{reward_type_of_object}{The type of the reward earned by delivering
#'   the bundle, where the type may be O for "object," BO for "big object,"
#'   F for "furniture," H  for "hat", C for "clothing", or R for "ring". A bundle
#'   reward may include more than one type.}
#'   \item{reward_object_id}{id of the object given as a reward
#'   for completing the bundle}
#'   \item{reward_number_of_object_given}{The count of the object given as a reward}
#'   \item{required_objects}{Space-delimited triples for the items required in
#'   the bundle. Each triple contains (in order) the object id, the number
#'   of objects required, and the minimum quality of object. If the first value
#'   (for object id) is -1, then the required object is an amount of gold, and
#'   both the quality and number of items required should be the same,
#'   representing the amount of gold.}
#'   \item{required_object_is_gold}{Type logical representing if the object required
#'   to complete the quest is gold}
#'   \item{color_index}{Color index of the bundle color}
#'   \item{min_number_of_items}{a description of the building}
#' }
#' @source Data loaded from \url{https://github.com/aftonsteps/stardewdata} which
#' in turn depends on \url{https://github.com/LeonBlade/xnbcli} for extracting the data
#' from the game.
#' Descriptions of the variables summarized from \url{https://stardewvalleywiki.com/Modding:Bundles}
"bundles"

#' Categories
#'
#' A dataset the category object ID's and names. Categories always have a negative
#' object id, and this dataset can be useful for determining what a category means --
#' for example, when joined to `objects`.
#'
#' @format A data frame with 33 rows and 4 variables:
#' \describe{
#'   \item{object_id}{the numberic id, always negative}
#'   \item{category_value}{the category value of the object in the game code as
#'   returned by `item.Category`, which is useful for modding the game}
#'   \item{game_name}{the name of the object in the game code, as returned by `item.getCategoryName()` (note that some are NA)}
#'   \item{category_name}{the name of the object, as in `game_name` but with NA's replaced}
#' }
#' @source  \url{https://stardewvalleywiki.com/Modding:Object_data}
"categories"

#' Caught Fish
#'
#' A dataset containing information about fish that are caught with a fishing pole.
#'
#' The spawn rate for fish functions by first shuffling the fish that are eligible
#' based on season, location, and time of day (plus seaweed/algae), and then calculating the base
#' spawn probability for the first fish of that list:
#'
#'  base spawn probability = spawn multiplier - max(0, minimum depth - actual depth) × depth multiplier × spawn multiplier + fishing level / 50
#'
#'  This probability is capped at a maximum of 90%. Then, the game rolls to determine
#'  if that fish will successfully spawn. If it does, then the player has a chance
#'  to catch it. If it does not succeed, then the next fish in the list is rolled
#'  for. If no fish succeed, then a random trash item spawns.
#'
#'  If you are looking for the location in which the fish spawn, see the `locations`
#'  dataset.
#'
#' @format A data frame with 55 rows and 15 variables:
#' \describe{
#'   \item{object_id}{The object id of the fish}
#'   \item{name}{The name of the fish}
#'   \item{chance_of_darting}{The probability of the fish making a dart}
#'   \item{darting_randomness}{A measure of the degree of randomness in darting}
#'   \item{min_size}{Minimum size of the fish}
#'   \item{max_size}{Maximum size of the fish}
#'   \item{min_time_of_spawn}{Earliest time of day for the spawn}
#'   \item{max_time_of_spawn}{Latest time of day for the spawn}
#'   \item{weather}{Weather during which the fish can appear}
#'   \item{min_depth}{Minimum depth where the fish can appear, where depth is
#'   the distance the bobber is from the shore}
#'   \item{spawn_multiplier}{The multiplier used for spawn rate calculations}
#'   \item{depth_multiplier}{The depth multiplier use in spawn rate calculations}
#'   \item{min_fishing_level}{The minimum character fishing level required for this
#'   fish to appear}
#' }
#' @source Data loaded from \url{https://github.com/aftonsteps/stardewdata} which
#' in turn depends on \url{https://github.com/LeonBlade/xnbcli} for extracting the data
#' from the game.
#' Descriptions of the variables summarized from \url{https://stardewvalleywiki.com/Modding:Fish_data}
"caught_fish"

#' Complete NPC Gift Tastes
#'
#' A dataset containing NPC gift tastes, including universal tastes.
#'
#' @format A data frame with 33 rows and 11 variables:
#' \describe{
#'   \item{npc_name}{the NPC name}
#'   \item{dialogue_type}{the type of dialogue (liked, loved, etc.)}
#'   \item{dialogue}{the dialogue the npc will say when receiving the gift}
#'   \item{item_type}{the item type (liked, loved, etc.)}
#'   \item{object_id}{the unique id of the object, which can join to `objects`, where
#'   negative values represent categories and not singular objects}
#'   \item{object_name}{the name of the object, if it is an object}
#'   \item{category_name}{the name of the category, if it is a category}
#' }
#' @source Data loaded from \url{https://github.com/aftonsteps/stardewdata} which
#' in turn depends on \url{https://github.com/LeonBlade/xnbcli} for extracting the data
#' from the game. Descriptions of the variables summarized from
#' \url{https://stardewvalleywiki.com/Modding:Gift_taste_data}
"complete_npc_gift_tastes"

#' Cooking Recipes
#'
#' A dataset containing recipes that are made by cooking.
#'
#' @format A data frame with 80 rows and 4 variables:
#' \describe{
#'   \item{name}{The name of the cooking recipe}
#'   \item{ingredients}{A space delimited set of pairs, where the first item in
#'   the pair is either an entire category (in which case, it is preceded by a
#'   negative sign) or the object id of a specific item, and where the second item
#'   in the pair is the number of objects required for the recipe}
#'   \item{yield_object_id}{The object id of the resulting item}
#'   \item{unlock_conditions}{A space delimited list of the conditions for unlocking
#'   the recipe. If not null, the first element is a letter that represents the type of
#'   event, with "f" for friendship, "l" for player level, and "s" for skill. If "l",
#'   then the next value is the level required. If "f" then the second element
#'   is the character to befriend and the third is the required friendship level.
#'   If "s," then the second element is the skill required and the third is the level
#'   required in this skill. If the unlock condition is "null" or "default", then it
#'   is either automatically unlocked at the start of the game, or it has a more
#'   complex storyline event in order to unlock it.}
#' }
#' @source Data loaded from \url{https://github.com/aftonsteps/stardewdata} which
#' in turn depends on \url{https://github.com/LeonBlade/xnbcli} for extracting the data
#' from the game. Descriptions of the variables summarized from
#' \url{https://stardewvalleywiki.com/Modding:Recipe_data}
"cooking_recipes"

#' Crafting Recipes
#'
#' A dataset containing recipes that are made by crafting.
#'
#' @format A data frame with 80 rows and 5 variables:
#' \describe{
#'   \item{name}{The name of the cooking recipe}
#'   \item{ingredients}{A space delimited set of pairs, where the first item in
#'   the pair is either an entire category (in which case, it is preceded by a
#'   negative sign) or the object id of a specific item, and where the second item
#'   in the pair is the number of objects required for the recipe}
#'   \item{yield_object_id}{The object id of the resulting item}
#'   \item{big_craftable}{Whether or not the object is a big craftable item, where
#'   possible values are "Big Craftable", "Ring" (if it is a ring), or "Other"}
#'   \item{unlock_conditions}{A space delimited list of the conditions for unlocking
#'   the recipe. If not null, the first element is a letter that represents the type of
#'   event, with "f" for friendship, "l" for player level, and "s" for skill. If "l",
#'   then the next value is the level required. If "f" then the second element
#'   is the character to befriend and the third is the required friendship level.
#'   If "s," then the second element is the skill required and the third is the level
#'   required in this skill. If the unlock condition "default", then it
#'   is automatically unlocked at the start of the game. Some events may have
#'   more complex unlock conditions described in text, rather than followin the
#'   above convention.}
#' }
#' @source Data loaded from \url{https://github.com/aftonsteps/stardewdata} which
#' in turn depends on \url{https://github.com/LeonBlade/xnbcli} for extracting the data
#' from the game. Descriptions of the variables summarized from
#' \url{https://stardewvalleywiki.com/Modding:Recipe_data}
"crafting_recipes"


#' Crops Data
#'
#' A dataset containing information about seeds, crops, crop growing
#' Stardew Valley. Much of this information concerns the growing of crops from
#' seeds. If you want information about the crop (e.g. fruits and vegetables)
#' that result from growing, you may want to join this table to `object_information`
#' on `index_of_harvest` = `object_id`.
#'
#' @format A data frame with 42 rows and 22 variables:
#' \describe{
#'   \item{objectid}{unique id of the object, but note that this joins to the
#'   seed's id, not the full-grown crop's id in other datasets. If you want to
#'   join this crops table to the information about the resulting crop (e.g. fruit
#'   or vegatable resulting from growing) then join on `crops$index_of_harvest` =
#'   `object_information$id`.}
#'   \item{days_in_stage_1_growth}{days in first stage of growth}
#'   \item{days_in_stage_2_growth}{days in second stage of growth}
#'   \item{days_in_stage_3_growth}{days in third stage of growth, and if NA then
#'   growth is completed prior to this stage}
#'   \item{days_in_stage_4_growth}{days in fourth stage of growth, and if NA then
#'   growth is completed prior to this stage}
#'   \item{days_in_stage_5_growth}{days in fifth stage of growth, and if NA then
#'   growth is completed prior to this stage}
#'   \item{growth_season_spring}{boolean representing if the crop grows in
#'   spring}
#'   \item{growth_season_summer}{boolean representing if the crop grows in
#'   summer}
#'   \item{growth_season_fall}{boolean representing if the crop grows in
#'   fall}
#'   \item{growth_season_winter}{boolean representing if the crop grows in
#'   winter}
#'   \item{index_in_sprite_sheet}{index of the sprite associated with this crop}
#'   \item{index_of_harvest}{objectid of the fully-grown crop, in constrast with
#'   `objectid` which is the unique id of the seed}
#'   \item{regrow_after_harvest}{-1 if the crop only grows once, and otherwise
#'   the number of days required to produce a new crop yield}
#'   \item{harvest_method}{1 if the item must be harvested with a scythe, else
#'   0}
#'   \item{chance_for_extra_harvest}{boolean representing if this plant allows
#'   probabilistic extra crop(s) at harvest}
#'   \item{min_extra_harvest}{the minimum number of extra crops produced, if an
#'   "extra harvest" event occurs}
#'   \item{max_extra_harvest}{the maximum number of extra crops produced, if an
#'   "extra harvest" event occurs}
#'   \item{max_harvest_increase_per_farming_level}{the maximum increase in crops
#'   per farming level, which adds to `max_extra_harvest`}
#'   \item{chance_for_extra_crops}{the probability of getting an extra harvest}
#'   \item{raised_seeds}{boolean representing if this crop grows on a raised
#'   item such as a pole subsequently and block your character from walking
#'   through this square}
#'   \item{tint_color}{boolean representing if ths item has special tints, e.g.
#'   certain flowers have various possible colors}
#'   \item{tint_color_value}{if `tint_color` is true, then sets of rgb values for
#'   each of the possible tints}
#' }
#' @source Data loaded from \url{https://github.com/aftonsteps/stardewdata} which
#' in turn depends on \url{https://github.com/LeonBlade/xnbcli} for extracting the data
#' from the game. Descriptions of the variables summarized from
#' \url{https://stardewvalleywiki.com/Modding:Crop_data}
"crops"

#' Furniture
#'
#' A dataset containing information about furniture in Stardew Valley.
#'
#' @format A data frame with 347 rows and 9 variables:
#' \describe{
#'   \item{objectid}{Unique id of the furniture item}
#'   \item{name}{The name of the piece of furniture}
#'   \item{source_rectangle_width}{The width of the rectangle of the item}
#'   \item{source_rectangle_width}{The height of the rectangle of the item}
#'   \item{bounding_box_width}{The width of the object's bounding box}
#'   \item{bounding_box_height}{The height of the object's bounding box}
#'   \item{rotations}{The number of possible rotations of the object, where 1 =
#'   only one view, 2 = two rotations (180 degrees), and 4 = four rotations (90
#'   degrees)}
#'   \item{price}{The price of the furniture}
#' }
#' @source Data loaded from \url{https://github.com/aftonsteps/stardewdata} which
#' in turn depends on \url{https://github.com/LeonBlade/xnbcli} for extracting the data
#' from the game. Descriptions of the variables summarized from
#' \url{https://stardewcommunitywiki.com/Modding:Furniture_data}
"furniture"

#' Hats
#'
#' A dataset containing information about hats in Stardew Valley. Hats can be
#' purchased from the hat shop owned by the mouse, and new hats are unlocked
#' when certain in-game achievements are completed.
#'
#' @format A data frame with 94 rows and 6 variables:
#' \describe{
#'   \item{object_id}{Unique id of the hat}
#'   \item{name}{The name of the hat}
#'   \item{description}{Description of the hat}
#'   \item{skip_hair_draw}{If true, then the hat does not change the player's
#'   hairstyle, but if false, then it may}
#'   \item{ignore_hairstyle_offset}{If true, then the hat occupies a fixed position,
#'   but if false, then it adjsut to the line of the player's hairstyle}
#'   \item{prismatic}{Is the hat a prismatic item?}
#' }
#' @source Data loaded from \url{https://github.com/aftonsteps/stardewdata} which
#' in turn depends on \url{https://github.com/LeonBlade/xnbcli} for extracting the data
#' from the game. Descriptions of the variables summarized from
#' \url{https://stardewcommunitywiki.com/Modding:Hat_data}
"hats"

#' Locations
#'
#' A dataset containing information about locations in Stardew Valley.
#' Locations have different foraging and fishing options depending on the time
#' of the year. Each datapoint in this dataset contains a space delimited list
#' of pairs. For foraging, this alternates the object id of the item with the probability it
#' appears (e.g. '384 .08 589 .09' means that object 384 has an 8% probability
#' of appearing and object 589 has a 9% probability of appearing). For
#' fish, this alternates the object id with the location id. Location id is -1 for
#' any pond or river, 0 for river.
#'
#' @format A data frame with 23 rows and 10 variables:
#' \describe{
#'   \item{name}{Name of the location}
#'   \item{spring_foraging}{Object id's and probabilities of items which can be foraged in this area
#'   during spring}
#'   \item{summer_foraging}{Object id's and probabilities of items which can be foraged in this area
#'   during summer}
#'   \item{fall_foraging}{Object id's and probabilities of items which can be foraged in this area
#'   during fall}
#'   \item{winter_foraging}{Object id's and probabilities of items which can be foraged in this area
#'   during winter}
#'   \item{spring_fishing}{Object id's and probabilities of fish which can be caught in this area
#'   during spring}
#'   \item{summer_fishing}{Object id's and probabilities of fish which can be caught in this area
#'   during summer}
#'   \item{fall_fishing}{Object id's of and probabilities fish which can be caught in this area
#'   during fall}
#'   \item{winter_fishing}{Object id's and probabilities of fish which can be caught in this area
#'   during winter}
#'   \item{artifact_data}{Object id's and probabilities of artifacts which can be found in this area}
#' }
#' @source Data loaded from \url{https://github.com/aftonsteps/stardewdata} which
#' in turn depends on \url{https://github.com/LeonBlade/xnbcli} for extracting the data
#' from the game. Descriptions of the variables summarized from
#' \url{https://stardewcommunitywiki.com/Modding:Hat_data}
"locations"

#' NPC Gift Tastes
#'
#' A dataset containing NPC gift tastes that are specific to that NPC,
#' not including universal tastes. For universal gift tastes, see
#' `universal_gift_tastes`, and for the two sets pre-combined, see
#' `complete_npc_gift_tastes`.
#'
#' @format A data frame with 738 rows and 7 variables:
#' \describe{
#'   \item{npc_name}{the NPC name}
#'   \item{dialogue_type}{the type of dialogue (liked, loved, etc.)}
#'   \item{dialogue}{the dialogue the npc will say when receiving the gift}
#'   \item{item_type}{the item type (liked, loved, etc.)}
#'   \item{object_id}{the unique id of the object, which can join to `objects`, where
#'   negative values represent categories and not singular objects}
#'   \item{object_name}{the name of the object, if it is an object}
#'   \item{category_name}{the name of the category, if it is a category}
#' }
#' @source Data loaded from \url{https://github.com/aftonsteps/stardewdata} which
#' in turn depends on \url{https://github.com/LeonBlade/xnbcli} for extracting the data
#' from the game. Descriptions of the variables summarized from
#' \url{https://stardewvalleywiki.com/Modding:Gift_taste_data}
"npc_gift_tastes"

#' Objects
#'
#' A dataset containing information about various objects found in Stardew
#' Valley. Certain objects are not contained in this dataset, specifically
#' crops, foods and drinks, geodes, and rings, which you can find in the
#' `crops`, `food_and_drinks`, `geodes`, and `rings` datasets.
#'
#' @format A data frame with 702 rows and 8 variables:
#' \describe{
#'   \item{object_id}{Object id of the object}
#'   \item{name}{Name of the object}
#'   \item{price}{Price of the object}
#'   \item{edibility}{Value used to determine health/energy regained by eating the item.
#'   The energy gained is 2.5 x `edibility`, and the health gained is 1.125 x `edibility`.
#'   Note that the amount of health shown in the tooltip is only 1 x `edibility` but
#'   the actual amount gained is 1.125 x `edibility`.}
#'   \item{category}{The category of the object}
#'   \item{type}{Type of object object}
#'   \item{english_name}{The name of the object in English, and a duplicate of
#'   `name` (may update in the future to include other language names)}
#'   \item{description}{Description of the food or drink item}
#' }
#' @source Data loaded from \url{https://github.com/aftonsteps/stardewdata} which
#' in turn depends on \url{https://github.com/LeonBlade/xnbcli} for extracting the data
#' from the game. Descriptions of the variables summarized from
#' \url{https://stardewcommunitywiki.com/Modding:Object_data}
"objects"

#' Universal Gift Tastes
#'
#' A dataset containing universal gift tastes, which apply for every NPC
#' unless that NPC specifies in `npc_gift_tastes` a different preference for that
#' item, which overrules `universal_gift_tastes`.
#'
#' @format A data frame with 88 rows and 4 variables:
#' \describe{
#'   \item{universal_type}{type of the object (e.g. liked or loved)}
#'   \item{object_id}{the unique identifier of the object, which can be joined
#'   to `objects`, where a negative value represents a category and not a singular object}
#'   \item{object_name}{the name of the object if it is an object}
#'   \item{category_name}{the name of the object if it is a category}
#' }
#' @source Data loaded from \url{https://github.com/aftonsteps/stardewdata} which
#' in turn depends on \url{https://github.com/LeonBlade/xnbcli} for extracting the data
#' from the game. Descriptions of the variables summarized from
#' \url{https://stardewcommunitywiki.com/Modding:Gift_taste_data}
"universal_gift_tastes"
