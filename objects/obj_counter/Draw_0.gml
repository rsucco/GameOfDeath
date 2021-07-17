/// @description Draw deets
draw_set_font(fnt_default)
draw_set_color(c_red)
draw_text(x + 22, y + 2, "Player 1 Score: " + string(global.player1_score))
draw_set_color(c_blue)
draw_text(x + 256, y + 2, "Player 2 Score: " + string(global.player2_score))