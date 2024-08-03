class_name NavigationControl extends LineEdit


@export var options : Array[String]
var current_index : int = 0

signal item_selected(index)


func _ready():
	change_index(0)
	focus_mode = Control.FOCUS_NONE
	selecting_enabled = false


func change_index(to : int):
	current_index = to
	
	if current_index < 0:
		current_index = options.size() - 1
	elif current_index >= options.size():
		current_index = 0
	
	text = options[current_index]
	emit_signal("item_selected", current_index)


func _on_left_button_down():
	change_index(current_index - 1)


func _on_right_button_down():
	change_index(current_index + 1)
