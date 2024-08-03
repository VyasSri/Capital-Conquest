extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()


func _on_storymode_button_pressed():
	get_tree().change_scene_to_file("res://Levels/CutScene1.tscn")


func _on_online_button_pressed():
	get_tree().change_scene_to_file("res://lobby.tscn")


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Main Menu/main_menu.tscn")
