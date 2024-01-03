extends Node

var username : String
var team
var pokedex 
var moves
var selected_part_pokemon = 0

func _ready():
	team = read_json_from_file("res://Data/party.json")
	pokedex = read_json_from_file("res://Data/pokedex.json")
	moves = read_json_from_file("res://Data/moves.json")


func read_json_from_file(file_path : String):
	var file = FileAccess.open(file_path, FileAccess.READ)
	var content = file.get_as_text()
	var json = JSON.new()
	var finish = json.parse_string(content)
	return finish

func zeros_check(number):
	if str(number).length() == 1:
		return "00" + str(number)
	elif str(number).length() == 2:
		return "0" + str(number)
	else:
		return str(number)
	
