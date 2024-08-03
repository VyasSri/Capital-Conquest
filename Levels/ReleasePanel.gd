class_name ReleasePanel extends UI_Panel



func on_show():
	$GameOption.options.clear()
	for game in Globals.get_games_we_can_release():
		$"../../StudioPanelHolder/ButtonPress".play()
		$GameOption.options.append(DevelopPanel.Genre.keys()[game.genre])
	$GameOption.change_index(0)


func _on_release_button_down():
	$"../../StudioPanelHolder/ButtonPress".play()
	var game_to_release = Globals.get_games_we_can_release()[$GameOption.current_index]
	Globals.games_to_release.erase(game_to_release)
	Globals.released_games.append(game_to_release)
	game_to_release.price_per_unit = int($PriceInfo.text)
	hide()
