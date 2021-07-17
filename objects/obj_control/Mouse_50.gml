/// @description Create cell

if cells_to_place > 0 {
	// Get cell grid position
	grid_x = (mouse_x - 24) div 12
	grid_y = (mouse_y - 24) div 12
	if next_grid[# grid_x, grid_y] == 0 {
		next_grid[# grid_x, grid_y] = global.player_up
		cells_to_place--
		if cells_to_place == 0 {
			run_generations(floor((global.player1_score + global.player2_score) * 5 / sqrt(obj_counter.counter)) + irandom_range(1, 50))
		}
	}	
}
