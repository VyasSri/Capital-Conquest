class_name StockPanel extends UI_Panel

@onready var confirm_button : Button = $ConfirmButton

enum Shares {SmallCap, MidCap, LargeCap}

enum MarketState {Depression, Recession, Normal, Boom}



@export var invest_amounts := {
	"Small-Cap" : 3000,
	"Mid-Cap" : 8000,
	"Large-Cap" : 15000
}

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	$ConfirmationMsg.text = "Are you sure you\nwant to invest? It will\ncost $3000"
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_invest_option_item_selected(index):
	Globals.investAmt = invest_amounts.values()[$InvestOption.current_index]
	if Globals.money >= Globals.investAmt:
		$ConfirmationMsg.text = "Are you sure you want to\ninvest? It will\ncost $" + str(Globals.investAmt)
		$ConfirmButton.disabled = false
	elif Globals.money < Globals.investAmt && Globals.money:
		$ConfirmationMsg.text = "You don't have funds!"
		$ConfirmButton.disabled = true

func _on_confirm_button_button_down():
	$"../../StudioPanelHolder/ButtonPress".play()
	Globals.ui.modify_money(-Globals.investAmt)
	Globals.confirmed = true
	hide()
	
