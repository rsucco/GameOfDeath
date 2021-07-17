/// @description Initialize game

game_set_speed(30, gamespeed_fps)
// Declare globals
global.player_up = 1
global.tile_size = 10
global.grid_size = 75
global.pause = true
global.generations_to_run = 0
global.player1_score = 0
global.player2_score = 0
new_game = false
cells_to_place = 0

set_message("Press enter to start a new game", -1)

// Create tiles
grid = ds_grid_create(global.grid_size, global.grid_size)
ds_grid_clear(grid, 0)
next_grid = ds_grid_create(global.grid_size, global.grid_size)
//for (var i = 0; i < global.grid_size; i += 1) {
//	for (var j = 0; j < global.grid_size; j += 1) {
//		grid[# i, j] = choose(0, 1, 2)
//	}
//}

