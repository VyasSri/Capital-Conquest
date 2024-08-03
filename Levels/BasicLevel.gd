extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Globals.money = int($UI/Money.text)
	#multiplayer score submission
	if Input.is_action_pressed("submit score"):
		$Control.show()
	if Input.is_action_just_pressed("Quit"):
	#for the escape key
		get_tree().quit()
	if Input.is_action_pressed("Skip A"):
	#skip to the win screen for level 1
		get_tree().change_scene_to_file("res://Levels/Winner 1.tscn")
		Globals.ui.set_money(50000);
		Globals.current_year = 1995;
		Globals.current_month = 1;
	if Input.is_action_pressed("Skip"):
		#skip to the lose screen of level 1
		get_tree().change_scene_to_file("res://Levels/Loser 1.tscn")
	if int($UI/Money.text) >= 100000:
		Globals.current_year = 1995
		Globals.current_month = 1
		Globals.total_elapsed_months = 1
		Globals.ui.set_money(50000)
		get_tree().change_scene_to_file("res://Levels/Winner 1.tscn")
	if int($UI/Money.text) < 100000 && Globals.current_year == 2005:
	#conditions to lose the level
		Globals.current_year = 1995
		Globals.current_month = 1
		Globals.total_elapsed_months = 1
		Globals.ui.set_money(50000)
		get_tree().change_scene_to_file("res://Levels/Loser1.tscn")
		
