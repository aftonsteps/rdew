## Gets the .xnb game data files from the Stardew Valley folder, copies them
## to the xnbcli folder, runs xnbcli on them, and then copies the resulting
## .json files to this package, where they will be imported and stored as
## package data.

system("data-raw/get_game_data")
system("data-raw/move_game_data.sh")
