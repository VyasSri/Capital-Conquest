class_name UI_Manager extends CanvasLayer


@onready var money_label : Label = $Money
@onready var event_label : Label = $Event
@onready var year_label : Label = $Year


var invest_index = 0

var money : int = 50000


func _ready():
	Globals.ui = self
	Globals.month_pass_validated.connect(update_year_label)
	set_money(money)
	event_label.text = "..."
	market_state()
	if get_tree().current_scene.name == "Level2":
		$Problems.text = "Business is\ngoing smoothly"
	

func update_year_label():
	year_label.text = "Year: " + str(Globals.current_year) + " Month: " + str(Globals.current_month)


func set_money(amount : int):
	money = amount
	money_label.text = str(money)


func modify_money(amount_of_change : int):
	set_money(money + amount_of_change)

func market_state():
	var rng = RandomNumberGenerator.new()
	var num = rng.randi_range(1,10)
	if num >= 1 && num <= 2:
		event_label.text = "Depression"
		invest_index = 0
	elif num >=3 && num <=5:
		event_label.text = "Recession"
		invest_index = 1
	elif num >=6 && num <=8:
		event_label.text = "Market is Normal"
		invest_index = 2
	else:
		event_label.text = "Market is Booming"
		invest_index = 3

func calc_random_problem():
	var rng = RandomNumberGenerator.new()
	var num = rng.randi_range(1,3)
	if num == 1:
		$Problems.text = "Business is\ngoing smoothly!"
	if num == 2:
		$Problems.text = "Vestor has marked\ndown his products!\nYour games are\nlosing value.\nYou just lost $10,000!"
		Globals.ui.modify_money(-10000)
	if num == 3:
		$Problems.text = "Vestor has made\nyour workers strike!\nYou just lost $7,500!"
		Globals.ui.modify_money(-7500)
