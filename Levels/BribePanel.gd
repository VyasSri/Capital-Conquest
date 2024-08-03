class_name BribePanel extends UI_Panel


@export var punishment_money : int = 10000


func on_show():
	$BribeResult.text = ""


func _on_confirm_button_down():
	$"../../StudioPanelHolder/ButtonPress".play()
	var rand = randi_range(1, 5)
	var every_game = Globals.get_every_game()
	if rand == 1:
		Globals.ui.modify_money(-punishment_money * 4)
		for game in every_game:
			game.popularity *= randi_range(1.2, 1.5)
			if game.popularity < 0.4:
				game.popularity = 0.4
		$BribeResult.text = "You got Caught!."
	else:
		Globals.ui.modify_money(-punishment_money * 4)
		for game in every_game:
			game.popularity *= randi_range(0.7, 0.9)
			if game.popularity < 0.4:
				game.popularity = 0.4
		
		$BribeResult.text = "You got Caught!"
