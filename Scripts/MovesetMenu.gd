extends Control

@onready var moves_ui = $Moves
@onready var move_boxes = moves_ui.get_children()
@onready var power_label = $PowerLabel
@onready var accuracy_label = $AccuracyLabel

func setup():
	var pokemon = Global.team[Global.selected_part_pokemon]
	var count = 0
	for i in move_boxes:
		i.hide()
	
	for i in pokemon["moves"]:
		var data = Global.moves[i["id"] - 1]
		
		move_boxes[count].get_node("TypeTexture").set_texture(load("res://Assets/UI/Menus/typeIcons/" + data["type"] + ".png"))
		move_boxes[count].get_node("MoveName").text = data["ename"]
		move_boxes[count].get_node("MovePP").text = "PP" + str(i["pp"]) + "/" + str(data["pp"])
		
		move_boxes[count].show()
		count +=1


func _on_moveslot_1_pressed():
	var move = Global.moves[Global.team[Global.selected_part_pokemon]["moves"][0]["id"] - 1]
	power_label.text = str(move["power"])
	accuracy_label.text = str(move["accuracy"])


func _on_moveslot_2_pressed():
	var move = Global.moves[Global.team[Global.selected_part_pokemon]["moves"][1]["id"] - 1]
	power_label.text = str(move["power"])
	accuracy_label.text = str(move["accuracy"])


func _on_moveslot_3_pressed():
	var move = Global.moves[Global.team[Global.selected_part_pokemon]["moves"][2]["id"] - 1]
	power_label.text = str(move["power"])
	accuracy_label.text = str(move["accuracy"])


func _on_moveslot_4_pressed():
	var move = Global.moves[Global.team[Global.selected_part_pokemon]["moves"][3]["id"] - 1]
	power_label.text = str(move["power"])
	accuracy_label.text = str(move["accuracy"])
