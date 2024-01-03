extends Control


@onready var lead_pokemon = $LeadPokemon
@onready var option_menu = $OptionsMenu
@onready var party_pokemon = $VBoxContainer

func _ready():
	
	var first_id
	if str(Global.team[0]["id"]).left(2) == "00":
		first_id = str(Global.team[0]["id"]).right(1)
	elif str(Global.team[0]["id"]).left(1) == "0":
		first_id = str(Global.team[0]["id"]).right(2)
	else:
		first_id = str(Global.team[0]["id"])
	lead_pokemon.get_node("NameLabel").text = Global.pokedex[first_id.to_int() - 1]["name"]["english"]
	lead_pokemon.get_node("PokemonSprite").set_texture(load("res://Assets/Sprites/sprites/" + Global.zeros_check(Global.team[0]["id"]) + "MS.png"))
	lead_pokemon.get_node("LevelLabel").text = str(Global.team[0]["level"])
	lead_pokemon.get_node("MaxHPLabel").text = str(Global.team[0]["stats"]["HP"])
	
	for child in party_pokemon.get_children():
		child.hide()
	
	var party = Global.team.duplicate()
	party.remove_at(0)
	var count = 0
	for i in party:
		var item = party_pokemon.get_children()[count]
		item.get_node("PokemonSprite").set_texture(load("res://Assets/Sprites/sprites/" + Global.zeros_check(i["id"]) + "MS.png"))
		item.get_node("LevelLabel").text = str(i["level"])
		item.get_node("NameLabel").text = Global.pokedex[i["id"] - 1]["name"]["english"]
		item.get_node("MaxHPLabel").text = str(i["stats"]["HP"])
		count += 1
		item.show()
		





func _on_lead_pokemon_pressed():
	Global.selected_part_pokemon = 0
	option_menu.show()


func _on_summary_menu_button_pressed():
	hide()
	get_parent().get_node("SummaryMenu").setup()
	get_parent().get_node("SummaryMenu").show()
	get_parent().get_node("SummaryMenu").get_node("BasicMenu").setup()
	get_parent().get_node("SummaryMenu").get_node("StatsMenu").setup()
	get_parent().get_node("SummaryMenu").get_node("MovesetMenu").setup()


func _on_close_button_pressed():
	option_menu.hide()


func _on_cancel_button_pressed():
	hide()
	get_parent().get_node("StartMenu").show()


func _on_pokemon_2_pressed():
	Global.selected_part_pokemon = 1
	option_menu.show()


func _on_pokemon_3_pressed():
	Global.selected_part_pokemon = 2
	option_menu.show()


func _on_pokemon_4_pressed():
	Global.selected_part_pokemon = 3
	option_menu.show()


func _on_pokemon_5_pressed():
	Global.selected_part_pokemon = 4
	option_menu.show()


func _on_pokemon_6_pressed():
	Global.selected_part_pokemon = 5
	option_menu.show()
