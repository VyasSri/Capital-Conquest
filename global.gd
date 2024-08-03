extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	
  SilentWolf.configure({
	"api_key": "9qFaMvfyNS30hASui2jDu8B8P3mS4bD99bFrJEaG",
	"game_id": "capitalconquest1",
	"log_level": 1
  })

  SilentWolf.configure_scores({
	"open_scene_on_close": "res://main.tscn"
  })



