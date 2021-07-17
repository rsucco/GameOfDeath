/// @description Start a new game

// Big bang
for (var i = 0; i < global.grid_size; i++) {
	for (var j = 0; j < global.grid_size; j++) {
		next_grid[# i, j] = choose(0, 0, 0, 1, 2)
	}
}

// Run 100 generations
obj_counter.counter = 0
run_generations(100)
new_game = true