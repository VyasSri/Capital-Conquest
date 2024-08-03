class_name PRBasePanel extends UI_Panel


@export var trends_panel : UI_Panel
@export var review_panel : ReviewPanel
@export var bribe_panel : BribePanel


func _ready():
	super._ready()
	Globals.month_pass_validated.connect(_on_month_passed)
	review_panel.hidden.connect(set_review_button_enable_state)
	set_review_button_enable_state()


func _on_trends_button_down():
	$"../../StudioPanelHolder/ButtonPress".play()
	trends_panel.show()
	var trend_panel_label = trends_panel.get_node("Label")
	trend_panel_label.text = Globals.parse_popularity_message()


func _on_month_passed():
	set_review_button_enable_state()


func set_review_button_enable_state():
	$ReviewRequestButton.disabled = Globals.released_games.is_empty()


func _on_review_request_button_down():
	$"../../StudioPanelHolder/ButtonPress".play()
	review_panel.show()



func _on_bribe_button_down():
	$"../../StudioPanelHolder/ButtonPress".play()
	bribe_panel.show()

