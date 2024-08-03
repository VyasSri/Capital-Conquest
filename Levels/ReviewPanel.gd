class_name ReviewPanel extends UI_Panel


func on_show():
	$ReviewResult.text = ""
	$GameOption.options.clear()
	for game in Globals.released_games:
		$GameOption.options.append(DevelopPanel.Genre.keys()[game.genre])
	$GameOption.change_index(0)


func _on_confirm_button_down():
	$"../../StudioPanelHolder/ButtonPress".play()
	generate_review(Globals.released_games[$GameOption.current_index])


func generate_review(game : GameInfo):
	var score : int = randi_range(0, 10)
	
	if game.quality == DevelopPanel.Quality.Low:
		if score < 8:
			score /= randf_range(1.0, 3.0)
		else:
			score /= randf_range(1.0, 4.0)
	elif game.quality == DevelopPanel.Quality.Medium:
		score *= randf_range(0.75, 1.25)
	elif game.quality == DevelopPanel.Quality.High:
		score *= randf_range(1.2, 1.5)
	
	if score > 10:
		score = 10
	elif score < 0:
		score = 0
	
	$ReviewResult.text = "Your rating is: " + str(score) + " / 10."
	
	# 1.0 -> 0.7 (-> up to 1.3)
	game.popularity -= 5 * 0.06
	game.popularity += score * 0.06
	if game.popularity < 0.4:
		game.popularity = 0.4
