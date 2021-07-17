/// @description Calculate game grid
if !global.pause {
	// Create check grid where player number is irrelevant
	// This is needed so we can easily sum up the neighbors
	var check_grid = ds_grid_create(global.grid_size, global.grid_size)
	for (var i = 0; i < global.grid_size; i++) {
		for (var j = 0; j < global.grid_size; j++) {
			if grid[# i, j] > 0 {
				check_grid[# i, j] = 1
			} else {
				check_grid[# i, j] = 0
			}
		}
	}
	global.player1_score = 0
	global.player2_score = 0
	// Calculate the state of the next iteration
	ds_grid_clear(next_grid, 0)
	for (var i = 0; i < global.grid_size; i++) {
		for (var j = 0; j < global.grid_size; j++) {
			var cell = grid[# i, j]
			// Calculate player scores
			if cell == 1 {
				global.player1_score++
			} else if cell == 2 {
				global.player2_score++
			}
			// Make sure the indices don't go out of bounds
			var x1 = max(i - 1, 0)
			var y1 = max(j - 1, 0)
			var x2 = min(i + 1, global.grid_size)
			var y2 = min(j + 1, global.grid_size)
			var neighbors = ds_grid_get_sum(check_grid, x1, y1, x2, y2)
			// A living cell with 2 or 3 neighbors persists (3 or 4 here because the cell itself is included)
			if (cell > 0) && (neighbors == 3 || neighbors == 4) {
				next_grid[# i, j] = cell
			} else if (cell == 0 && neighbors == 3) {
				// An empty cell with 3 neighbors comes to life
				// The 'species' of the cell depends on which player's cells make up the majority of the 3 neighbors
				if ds_grid_get_sum(grid, x1, y1, x2, y2) < 5 {
					next_grid[# i, j] = 1
				} else {
					next_grid[# i, j] = 2
				}
			}
			// Everything else bites it
		}
	}
}