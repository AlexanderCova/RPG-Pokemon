extends Control

@onready var main_menu = $MainMenuBackground
@onready var fight_menu = $FightMenuBackground
@onready var label = $MainMenuBackground/Label
@onready var sprite = $PokemonSprite
@onready var opponent_texture = $OpponentSprite
@onready var opponent_name = $OpponentHealthBackground/OpponentName
@onready var opponent_level = $OpponentHealthBackground/OpponentLvl

var turn = 0
#0 is our turn, 1 is opponents

func encounter(pokemon, body):
	mouse_filter = 0
	Global.can_move = false
	show()
	setup(pokemon)
	print(body)

func setup(opponent):
	label.text = "What Will \n" + str(Global.team[0]["nickname"]) + " Do?"
	sprite.set_texture(load("res://Assets/Sprites/sprites/" + str(Global.zeros_check(Global.team[0]["id"])) + "MS.png"))
	opponent_name.text = Global.pokedex[Global.zeros_check(opponent["id"]).to_int() - 1]["name"]["english"]
	opponent_level.text = str(opponent["level"])
	opponent_texture.set_texture(load("res://Assets/Sprites/sprites/" + str(Global.zeros_check(opponent["id"])) + "MS.png"))
	
	var opponent_stats = Global.pokedex[Global.zeros_check(opponent["id"]).to_int() - 1]["base"]
	
	print(opponent_stats)
	
	for i in opponent_stats:
		for x in range(0, opponent["level"]):
			opponent_stats[i] += randi_range(1,2)
	
	print(opponent_stats)
	

func _on_fight_button_pressed():
	main_menu.hide()
	fight_menu.show()
	fight_menu.setup()
