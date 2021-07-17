/// @description Draw game grid
// You can write your code in this editor

draw_set_alpha(1)
for (var i = 0; i < global.grid_size; i++) {
	for (var j = 0; j < global.grid_size; j++) {
		// Draw outline
		var new_x = i * (global.tile_size + 2) + 24
		var new_y = j * (global.tile_size + 2) + 24
		draw_set_color(c_gray)
		draw_rectangle(new_x, new_y, new_x + global.tile_size, new_y + global.tile_size, true)
		// Draw cell, if applicable
		var cell_player = next_grid[# i, j]
		if cell_player == 1 {
			draw_set_color(c_red)
		} else if cell_player == 2 {
			draw_set_color(c_blue)
		}
		if cell_player != 0 {
			draw_rectangle(new_x + 1, new_y + 1, new_x + global.tile_size - 1, new_y + global.tile_size - 1, false)
		} else {
			// Highlight area under mouse if there's no cell
			if (i == (mouse_x - 24) div 12) && (j == (mouse_y - 24) div 12) && cells_to_place > 0 {
				if global.player_up == 1 {
					draw_set_color(c_fuchsia)
				} else if global.player_up == 2 {
					draw_set_color(c_aqua)
				}
				draw_rectangle(new_x + 1, new_y + 1, new_x + global.tile_size - 1, new_y + global.tile_size - 1, false)
			}
		}
	}
}
