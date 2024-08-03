extends Node

var money : int = 0
var ui : UI_Manager
var games_to_release : Array
var released_games : Array

@export var goal_year : int = 2005
@export var realtime_seconds_per_ingame_month : int = 10
@export var base_revenue : int = 1000


var current_year : int = 1995
var current_month : int = 1
var total_elapsed_months : int = 1
var investAmt = 0
var confirmed : bool = false
var current_state : String = ""
var current_popularities := []

signal month_pass_validated


func _ready():
	current_popularities.resize(DevelopPanel.Genre.size())
	recalculate_genre_popularities()
	year_cycle()


func _process(delta):
	if Input.is_action_just_pressed("Debug1"):
		recalculate_genre_popularities()



func year_cycle():
	while(current_year != goal_year):
		await get_tree().create_timer(realtime_seconds_per_ingame_month).timeout
		current_month += 1
		total_elapsed_months += 1
		
		if total_elapsed_months % 3 == 0:
			recalculate_genre_popularities()
		
		if current_month == 13:
			current_year += 1
			current_month = 1
		
		_on_month_passed()
		if ui != null:
			if current_month % 3 == 0:
				ui.market_state()
		if get_tree().current_scene.name == "Level2" and current_month % 3 == 0:
			ui.calc_random_problem()
		
		
func recalculate_genre_popularities():
	var first_popularity : int = randi_range(40, 60)
	var second_popularity : int = first_popularity / 3 + randi_range(5, 15)
	var third_popularity : int = second_popularity / 3 + randi_range(5, 10)
	var forth_popularity : int = 100 - (first_popularity + second_popularity + third_popularity)
	if forth_popularity < 5:
		recalculate_genre_popularities()
		return
	var popularities = [first_popularity, second_popularity, third_popularity, forth_popularity]
	
	# [0, 1, 2, 3]
	var genre_indices = DevelopPanel.Genre.values()
	genre_indices.shuffle()
	
	for i in range(genre_indices.size()):
		var popularity_ranking : int = genre_indices.find(i)
		current_popularities[i] = popularities[popularity_ranking]


func parse_popularity_message() -> String:
	var sorted_popularities = current_popularities
	sorted_popularities.sort()
	sorted_popularities.reverse()
	
	var message = "The most popular genres are: "
	for i in range(4):
		var og_index = current_popularities.find(sorted_popularities[i])
		message += DevelopPanel.Genre.keys()[og_index] + " (" + str(current_popularities[og_index]) + "%)"
		if i < 3:
			message += ", "
		#print("Genre: " + DevelopPanel.Genre.keys()[genre_indices[i]] + ", Popularity: " + str(popularities[i]))
	return message


func _on_month_passed():
	for game_to_release in games_to_release:
		if game_to_release.finish_month <= total_elapsed_months:
			game_to_release.can_release = true
	
	generate_monthly_sales_revenue()
	
	emit_signal("month_pass_validated")


func generate_monthly_sales_revenue():
	for released_game in released_games:
		var monthly_revenue : int = 0
		
		var price_influence : float = 1.0
		if released_game.price_per_unit < 49:
			price_influence = randf_range(0.77, 0.85)
		elif released_game.price_per_unit > 49:
			price_influence = randf_range(0.6, 0.7)
		
		if released_game.quality == DevelopPanel.Quality.Low:
			price_influence = randf_range(0.6, 0.9)
		elif released_game.quality == DevelopPanel.Quality.High:
			price_influence = randf_range(1.15, 1.5)
		
		monthly_revenue = base_revenue * (current_popularities[released_game.genre] / 15) * randf_range(0.7, 1.5) * released_game.popularity
		released_game.revenue += monthly_revenue
		if ui != null:
			ui.modify_money(monthly_revenue)


func get_games_we_can_release() -> Array:
	var games := []
	for game in games_to_release:
		if game.can_release:
			games.append(game)
	return games


func get_every_game() -> Array:
	var games := []
	games.append_array(games_to_release)
	games.append_array(released_games)
	return games

