extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()
	if Input.is_action_pressed("Skip A"):
		get_tree().change_scene_to_file("res://Levels/wiinner_2.tscn")
	if Input.is_action_pressed("Skip"):
		get_tree().change_scene_to_file("res://Levels/loser_2.tscn")
	if int($UI/Money.text) >= 200000:
		Globals.current_year = 1995
		Globals.current_month = 1
		Globals.total_elapsed_months = 1
		Globals.ui.set_money(50000)
		get_tree().change_scene_to_file("res://Levels/wiinner_2.tscn")
	if int($UI/Money.text) < 200000 && Globals.current_year == 2005:
		Globals.current_year = 1995
		Globals.current_month = 1
		Globals.total_elapsed_months = 1
		Globals.ui.set_money(50000)
		get_tree().change_scene_to_file("res://Levels/loser_2.tscn")
