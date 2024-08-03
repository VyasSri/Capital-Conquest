class_name BankPanel extends UI_Panel

# Panels for investing and withdrawing
@export var invest_panel : StockPanel
@export var withdraw_panel : WithdrawPanel

# UI buttons
@onready var withdraw_button : Button = $WithdrawButton
@onready var invest_button : Button = $InvestButton

# Called when the node enters the scene tree for the first time
func _ready():
	super._ready()
	_set_withdraw_button_enable_state()

# Called every frame
func _process(delta):
	_set_withdraw_button_enable_state()

# Play sound and show invest panel on button press
func _on_invest_button_button_down():
	$"../../StudioPanelHolder/ButtonPress".play()
	invest_panel.show()

# Play sound and show withdraw panel on button press
func _on_withdraw_button_button_down():
	$"../../StudioPanelHolder/ButtonPress".play()
	withdraw_panel.show()

# Enable or disable withdraw button based on Globals.confirmed
func _set_withdraw_button_enable_state():
	withdraw_button.disabled = not Globals.confirmed
