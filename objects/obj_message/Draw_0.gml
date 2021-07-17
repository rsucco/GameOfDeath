/// @description Draw message

draw_set_font(fnt_default)
draw_set_color(c_white)
draw_set_alpha(min(message_age / 20, 1))
message_age += 1

// Decrement message timer
message_timer--
// Setting timer to a value less than 0 will cause it to be displayed indefinitely
if message_timer == 0 {
	message_text = ""
} else if message_timer > 0 && message_timer <= 20 {
	draw_set_alpha(min(message_timer / 20, 1))
}

draw_text(x, y + 2, message_text)