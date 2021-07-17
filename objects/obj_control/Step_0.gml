/// @description Main game logic

if !global.pause {
	// Prompt for players to create cells if necessary
	if global.generations_to_run == 1 {
		global.pause = true
		if new_game {
			// Player with the fewest cells after the big bang starts
			if global.player1_score > global.player2_score {
				global.player_up = 2
			} else {
				global.player_up = 1
			}
			cells_to_place = abs(global.player1_score - global.player2_score)
			set_message("Player " + string(global.player_up) + " starts. Create " + string(cells_to_place) + " cells.", -1)
			new_game = false
		} else {
			// Switch players once one's turn is up
			if global.player_up == 1 {
				global.player_up = 2
			} else {
				global.player_up = 1 
			}
			cells_to_place = max(5, floor((global.player1_score + global.player2_score) / obj_counter.counter * 50))
			set_message("Player " + string(global.player_up) + "'s turn. Create " + string(cells_to_place) + " cells.", -1)
		}
	} else if !global.pause && global.generations_to_run > 1 {
		// Check for a winner
		if !new_game {
			if global.player1_score == 0 {
				global.pause = true
				set_message("Player 2 wins!", -1)
			} else if global.player2_score == 0 {
				global.pause = true
				set_message("Player 1 wins!", -1)
			}
		}
		// Keep the game running if the game isn't paused
		global.generations_to_run--
	}

	
}