class_name UI_Panel extends Panel


signal shown


func _ready():
	hide()
	if has_node("HideButton"):
		$HideButton.button_down.connect(_on_hide_button_down)
	visibility_changed.connect(_on_visibility_changed)


func _on_visibility_changed():
	if visible:
		on_show()
		emit_signal("shown")
	else:
		on_hide()


func _on_hide_button_down():
	$"../../StudioPanelHolder/ButtonPress".play()
	hide()


func on_show():
	pass


func on_hide():
	pass
	
func checkMoney():
	pass
