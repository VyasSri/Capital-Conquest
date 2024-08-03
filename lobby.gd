extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
#	get_tree().connect("network_peer_connected", self, "Success")
	pass

func _process(delta):
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_button_pressed():
	SilentWolf.Scores.wipe_leaderboard()
	Globals.current_year = 1995
	Globals.current_month = 1
	Globals.total_elapsed_months = 1
	get_tree().change_scene_to_file("res://Levels/BasicLevel.tscn")
#	net.create_server(4242, 10)
#	get_tree().network_peer = net
	


func _on_join_pressed():
	Globals.current_year = 1995
	Globals.current_month = 1
	Globals.total_elapsed_months = 1
	get_tree().change_scene_to_file("res://Levels/BasicLevel.tscn")
#	var net = ENetMultiplayerPeer.new()
#	net.create_client("127.0.0.1", 4242)
#	get_tree().network_peer = net
	
#func Success(id):
#	Autoload.player_ids.append(id)
#	if Autoload.player_ids.size()>1:
#		var a = preload("res://Levels/BasicLevel.tscn")


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Levels/levels.tscn")
