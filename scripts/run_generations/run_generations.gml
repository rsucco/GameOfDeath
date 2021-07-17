function run_generations(num_generations){
	set_message("Running " + string(num_generations) + " generations...", num_generations)
	global.generations_to_run = num_generations
	global.pause = false
}