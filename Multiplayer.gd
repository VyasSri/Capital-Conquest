extends Node3D


var player = preload("res://Levels/Character.gd")


# Called when the node enters the scene tree for the first time.
func _ready():
	Autoload.net_id = get_tree().get_network_unique_id()
	for i in Autoload.player_ids:
		create_player(id)
	create_player(get_tree().get_network_unique_id())

func create_player(id):
	var a = player.instance()
	a.name = str(id)
	a.intialize(id)
	add_child(a)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()
	if Input.is_action_pressed("Skip A"):
		get_tree().change_scene_to_file("res://Levels/Winner 1.tscn")
	if Input.is_action_pressed("Skip"):
		get_tree().change_scene_to_file("res://Levels/Loser 1.tscn")
	if int($UI/Money.text) >= 100000:
		Globals.current_year = 1995
		Globals.current_month = 1
		Globals.total_elapsed_months = 1
		Globals.ui.set_money(50000)
		get_tree().change_scene_to_file("res://Levels/Winner 1.tscn")
	if int($UI/Money.text) < 100000 && Globals.current_year == 2005:
		Globals.current_year = 1995
		Globals.current_month = 1
		Globals.total_elapsed_months = 1
		Globals.ui.set_money(50000)
		get_tree().change_scene_to_file("res://Levels/Loser1.tscn")
		
