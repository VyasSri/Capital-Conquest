extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel.hide()
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()


func _on_start_button_pressed():
	SilentWolf.Scores.wipe_leaderboard()
	Globals.current_year = 1995
	Globals.current_month = 1
	Globals.total_elapsed_months = 1
	get_tree().change_scene_to_file("res://Levels/levels.tscn")



func _on_instructions_button_pressed():
	$Panel.visible = true


func _on_quit_button_pressed():
	get_tree().quit()


func _on_button_pressed():
	$Panel.hide()
