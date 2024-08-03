class_name WithdrawPanel extends UI_Panel
@export var ui : UI_Manager

@export var invest_multipliers := {
	"Depression" = -3,
	"Recession" = -1.3,
	"Normal" = 1.3,
	"Booming" = 3
}

func _ready():
	on_show()
func _process(delta):
	on_show()
	
func on_show():
	if ui.invest_index == 0:
		$Description.text = "Are you sure you want\nto withdraw? You will\nlose a lot on this trade"
	if ui.invest_index == 1:
		$Description.text = "Are you sure you want\nto withdraw? You will\nlose a little bit of\nmoney!"
	if ui.invest_index == 2:
		$Description.text = "Are you sure you want\nto withdraw? You will\ngain a little on this\ntrade"
	if ui.invest_index == 3:
		$Description.text = "Are you sure you want\nto withdraw? You will\ngain a lot on this trade!"
func _on_withdraw_button_button_down():
	$"../../StudioPanelHolder/ButtonPress".play()
	Globals.ui.modify_money(Globals.investAmt * invest_multipliers.values()[ui.invest_index])
	Globals.confirmed = false
	hide()
