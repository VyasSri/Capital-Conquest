class_name DevelopPanel extends UI_Panel

# Enums for genre and quality
enum Genre {Shooter, Educational, Racing, Soccer}
enum Quality {Low, Medium, High}

# Development times for each genre (in months)
@export var dev_month_times := {
	"Shooter" : 5,
	"Educational" : 1,
	"Racing" : 4,
	"Soccer" : 2
}

# Development costs for each genre
@export var dev_costs := {
	"Shooter" : 10000,
	"Educational" : 4000,
	"Racing" : 7000,
	"Soccer" : 2000
}

# Cost multipliers based on quality
@export var quality_dev_cost_multipliers := {
	"Low" : 0.7,
	"Normal" : 1.0,
	"High" : 1.3
}

# Time multipliers based on quality
@export var quality_dev_time_multipliers := {
	"Low" : 0.7,
	"Normal" : 1.0,
	"High" : 1.3
}

# Called when the node enters the scene tree for the first time
func _ready():
	super._ready()
	_on_genre_option_item_selected(0) # Initialize with first genre
	hide()

# Handle genre selection change
func _on_genre_option_item_selected(index):
	var cost_multiplier = quality_dev_cost_multipliers.values()[$QualityOption.current_index]
	var time_multiplier = quality_dev_time_multipliers.values()[$QualityOption.current_index]
	
	var month_time : int = dev_month_times.values()[index] * time_multiplier
	if month_time < 1:
		month_time = 1
	
	$TimeInfo.text = str(month_time) + " month"
	if month_time != 1:
		$TimeInfo.text += "s"
	
	var cost = dev_costs.values()[index] * cost_multiplier
	if cost < 1:
		cost = 1000
	$CostInfo.text = "$ " + str(dev_costs.values()[index] * cost_multiplier)

# Handle quality selection change
func _on_quality_option_item_selected(index):
	_on_genre_option_item_selected($GenreOption.current_index)

# Handle develop button press
func _on_develop_button_down():
	$"../../StudioPanelHolder/ButtonPress".play()
	var cost_multiplier = quality_dev_cost_multipliers.values()[$QualityOption.current_index]
	var time_multiplier = quality_dev_time_multipliers.values()[$QualityOption.current_index]
	
	var cost = dev_costs.values()[$GenreOption.current_index] * cost_multiplier
	if cost < 1:
		cost = 1000
	
	# Check if there is enough money to develop
	if cost > Globals.ui.money:
		return
	
	Globals.ui.modify_money(-cost)
	
	var month_time = dev_month_times.values()[$GenreOption.current_index] * time_multiplier
	if month_time < 1:
		month_time = 1
	
	# Create a new game info object and set its properties
	var game := GameInfo.new()
	game.genre = $GenreOption.current_index
	game.quality = $QualityOption.current_index
	game.start_month = Globals.total_elapsed_months
	game.finish_month = game.start_month + month_time
	Globals.games_to_release.append(game)
	
	hide()
