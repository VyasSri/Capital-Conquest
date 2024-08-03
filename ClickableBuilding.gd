class_name ClickableBuilding extends Area3D


@export var ui_to_show : Control
@onready var mouse_blocker : Control = get_tree().current_scene.get_node("UI/MouseBlocker")
var is_mouse_in_bounds : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)
	
	if ui_to_show != null:
		ui_to_show.hidden.connect(_on_ui_to_show_hidden)
		ui_to_show.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("left_click") && is_mouse_in_bounds && mouse_blocker.mouse_filter != Control.MOUSE_FILTER_STOP && ui_to_show != null:
		ui_to_show.show()
		mouse_blocker.mouse_filter = Control.MOUSE_FILTER_STOP


func _on_ui_to_show_hidden():
	mouse_blocker.mouse_filter = Control.MOUSE_FILTER_IGNORE


func _on_mouse_entered():
	is_mouse_in_bounds = true


func _on_mouse_exited():
	is_mouse_in_bounds = false
