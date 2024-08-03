class_name StudioBasePanel extends UI_Panel


@export var develop_panel : DevelopPanel
@export var release_panel : ReleasePanel
@onready var release_button : Button = $ReleaseButton


func _ready():
	super._ready()
	Globals.month_pass_validated.connect(_on_month_passed)
	release_button.disabled = true



func _on_develop_button_down():
	$"../../StudioPanelHolder/ButtonPress".play()
	develop_panel.show()



func _on_month_passed():
	set_release_button_enable_state()


func set_release_button_enable_state():
	var games_ready_to_release : Array
	for game in Globals.games_to_release:
		if game.can_release:
			games_ready_to_release.append(game)
	
	release_button.disabled = games_ready_to_release.is_empty()
	


func _on_release_button_down():
	$"../../StudioPanelHolder/ButtonPress".play()
	release_panel.show()



