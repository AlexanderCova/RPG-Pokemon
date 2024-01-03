extends Control

@onready var type1 = $Type1
@onready var type2 = $Type2
@onready var id_label = $IDLabel
@onready var name_label = $NameLabel

func setup():
	var pokemon = Global.team[Global.selected_part_pokemon]
	var types = Global.pokedex[pokemon["id"]- 1]["type"]
	
	id_label.text = Global.zeros_check(pokemon["id"])
	name_label.text = Global.pokedex[Global.team[Global.selected_part_pokemon]["id"] -1]["name"]["english"]
	
	if types.size() > 1:
		type1.show()
		type1.set_texture(load("res://Assets/UI/Menus/typeIcons/" + types[0] + ".png"))
		type2.show()
		type2.set_texture(load("res://Assets/UI/Menus/typeIcons/" + types[1] + ".png"))
	else:
		type1.show()
		type1.set_texture(load("res://Assets/UI/Menus/typeIcons/" + types[0] + ".png"))
		type2.hide()
