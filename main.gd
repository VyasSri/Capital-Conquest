extends Control

var  player_name
var score = 50000

@onready var leaderboard_scene = preload("res://addons/silent_wolf/Scores/Leaderboard.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var inputtext = $LineEdit.text
	player_name =inputtext
	SilentWolf.Scores.save_score(player_name, Globals.money)
	get_tree().change_scene_to_packed(leaderboard_scene)
