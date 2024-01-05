extends CanvasLayer

@onready var main_menu = $BattleScene/MainMenuBackground
@onready var fight_menu = $BattleScene/FightMenuBackground
@onready var label = $BattleScene/MainMenuBackground/Label
@onready var sprite = $BattleScene/PokemonSprite
@onready var opponent_texture = $BattleScene/OpponentSprite
@onready var opponent_name = $BattleScene/OpponentHealthBackground/OpponentName
@onready var opponent_level = $BattleScene/OpponentHealthBackground/OpponentLvl

var turn = 0
#0 is our turn, 1 is opponents
var is_open = false


func _process(delta):
	if Input.is_action_just_pressed("select"):
		encounter({"id" : 016,"level" : 2,"chance" : 0.25,})

func encounter(pokemon):
	
	Global.can_move = false
	show()
	setup(pokemon)
	

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
