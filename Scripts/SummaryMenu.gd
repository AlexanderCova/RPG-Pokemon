extends Control

@onready var name_label = $PokemonName
@onready var level_label = $PokemonLevel
@onready var sprite_texture = $"Pokemon Sprite"
@onready var tab_bar = $Tabs

@onready var basic_menu = $BasicMenu
@onready var stats_menu = $StatsMenu
@onready var moveset_menu = $MovesetMenu

func _ready():
	setup()

func setup():
	
	name_label.text = Global.team[Global.selected_part_pokemon]["nickname"]
	level_label.text = "Lv" + str(Global.team[Global.selected_part_pokemon]["level"])
	sprite_texture.set_texture(load("res://Assets/Sprites/sprites/"+ Global.zeros_check(Global.team[Global.selected_part_pokemon]["id"]) + "MS.png"))


func _on_cancel_button_pressed():
	hide()
	get_parent().get_node("PartyMenu").show()


func _on_tab_1_button_pressed():
	tab_bar.set_texture(load("res://Assets/UI/Menus/SummaryMenu/Tabs/Tab-1.png"))
	stats_menu.hide()
	moveset_menu.hide()
	basic_menu.show()
	basic_menu.setup()


func _on_tab_2_button_pressed():
	tab_bar.set_texture(load("res://Assets/UI/Menus/SummaryMenu/Tabs/Tab-2.png"))
	stats_menu.show()
	stats_menu.setup()
	moveset_menu.hide()
	basic_menu.hide()


func _on_tab_3_button_pressed():
	tab_bar.set_texture(load("res://Assets/UI/Menus/SummaryMenu/Tabs/Tab-3.png"))
	stats_menu.hide()
	moveset_menu.show()
	moveset_menu.setup()
	basic_menu.hide()
