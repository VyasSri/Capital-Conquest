extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()


func _on_button_pressed():
	Globals.current_year = 1995
	Globals.current_month = 1
	Globals.total_elapsed_months = 1
	get_tree().change_scene_to_file("res://Levels/levels.tscn")

func _on_button_2_pressed():
	Globals.current_year = 1995
	Globals.current_month = 1
	Globals.total_elapsed_months = 1
	get_tree().change_scene_to_file("res://Levels/Level2.tscn")
