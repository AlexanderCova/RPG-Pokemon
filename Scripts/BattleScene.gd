extends CanvasLayer

@onready var main_menu = $BattleScene/MainMenuBackground
@onready var fight_menu = $BattleScene/FightMenuBackground
@onready var text_box = $BattleScene/TextBoxBackground
@onready var label = $BattleScene/MainMenuBackground/Label
@onready var sprite = $BattleScene/PokemonSprite
@onready var opponent_texture = $BattleScene/OpponentSprite
@onready var opponent_name = $BattleScene/OpponentHealthBackground/OpponentName
@onready var opponent_level = $BattleScene/OpponentHealthBackground/OpponentLvl
@onready var pokemon_name = $BattleScene/HealthBackground/PokemonName
@onready var pokemon_level = $BattleScene/HealthBackground/PokemonLvl
@onready var opponent_health_bar = $BattleScene/OpponentHealthBackground/OpponentHealthBar
@onready var health_bar = $BattleScene/HealthBackground/HealthBar
@onready var text_box_button = $BattleScene/TextBoxBackground/TextBoxButton


var turn = 0
#0 is our turn, 1 is opponents
var is_open = false
var opponent_stats
var opponent_pokemon

func opponent_turn():
	main_menu.hide()
	text_box.show()
	var attacking_move = Global.moves[opponent_pokemon["moves"][randi_range(0, opponent_pokemon["moves"].size() - 1)] - 1]
	
	text_box.get_node("Label").text = attacking_move["ename"]
	if attacking_move["power"] != null:
		var damage = roundi(((((2 * opponent_pokemon["level"] / 5 + 2) * opponent_stats["Attack"] * attacking_move["power"] / Global.team[0]["stats"]["Defense"]) / 50) + 2) * randi_range(85, 100) / 100)
		Global.team[0]["health"] -= damage
		while health_bar.value != Global.team[0]["health"]:
			health_bar.value -= 1
		print("out of loop")
		turn = 0
		
	else:
		print(attacking_move["ename"])
	
	await text_box_button.pressed
	our_turn()
	print("end Opponents Turn")

func our_turn():
	main_menu.show()
	text_box.hide()


func encounter(pokemon):
	print(str(multiplayer.get_unique_id()) + " " + str(pokemon))
	Global.can_move = false
	show()
	setup(pokemon)
	

func setup(opponent):
	opponent_pokemon = opponent
	opponent_pokemon["moves"] = []
	
	
	for x in Global.movesets:
		if x["pokemon"] == opponent_pokemon["id"]:
			
			
			for i in x["moves"]:
				if i["method"] == "levelup" and i["level"] <= opponent["level"]:
					if opponent_pokemon["moves"].size() >= 4:
						opponent_pokemon["moves"][randi_range(0, 3)] = i["move"]
					else:
						print(opponent_pokemon["moves"])
						opponent_pokemon["moves"].append(i["move"])
				else: 
					break
	
	
	
	label.text = "What Will \n" + str(Global.team[0]["nickname"]) + " Do?"
	sprite.set_texture(load("res://Assets/Sprites/sprites/" + str(Global.zeros_check(Global.team[0]["id"])) + "MS.png"))
	pokemon_name.text = str(Global.team[0]["nickname"])
	pokemon_level.text = str(Global.team[0]["level"])
	health_bar.max_value = Global.team[0]["stats"]["HP"]
	health_bar.value = Global.team[0]["health"]
	
	opponent_name.text = Global.pokedex[Global.zeros_check(opponent["id"]).to_int() - 1]["name"]["english"]
	opponent_level.text = str(opponent["level"])
	opponent_texture.set_texture(load("res://Assets/Sprites/sprites/" + str(Global.zeros_check(opponent["id"])) + "MS.png"))
	
	opponent_stats = Global.pokedex[Global.zeros_check(opponent["id"]).to_int() - 1]["base"]
	
	
	
	for i in opponent_stats:
		for x in range(0, opponent["level"]):
			opponent_stats[i] += randi_range(1,2)
	
	print(opponent_stats)
	opponent_health_bar.max_value = opponent_stats["HP"]
	opponent_health_bar.value = opponent_stats["HP"]
	
	

func _on_fight_button_pressed():
	main_menu.hide()
	fight_menu.show()
	fight_menu.setup()


func _on_run_button_pressed():
	if opponent_stats["Speed"] <= Global.team[0]["stats"]["Speed"]:
		hide()
		Global.can_move = true
	else:
		if randi_range(0, 25) >= 20:
			hide()
			Global.can_move = true
		else:
			label.text = "Can't Get Away!"
			opponent_turn()


func _on_move_1_pressed():
	pass # Replace with function body.
