extends TextureRect


@onready var move_buttons = $MainMenu.get_children()
@onready var pp_label = $PPLabel
@onready var max_pp_label = $MaxPPLabel
@onready var type_texture = $TypeTexture

func setup():
	var moves = Global.team[0]["moves"]
	
	for i in move_buttons:
		i.hide()
	
	var count = 0
	for i in moves:
		var data = Global.moves[i["id"] - 1]
		move_buttons[count].text = data["ename"]
		move_buttons[count].show()
		count +=1

func show_info(move_num):
	var move = Global.team[0]["moves"][move_num]["id"]
	var data = Global.moves[move -1]
	
	pp_label.text = str(Global.team[0]["moves"][move_num]["pp"])
	max_pp_label.text = str(data["pp"])
	type_texture.set_texture(load("res://Assets/UI/Menus/typeIcons/" + data["type"] + ".png"))

func _on_move_1_mouse_entered():
	show_info(0)


func _on_move_2_mouse_entered():
	show_info(1)


func _on_move_3_mouse_entered():
	show_info(2)


func _on_move_4_mouse_entered():
	show_info(3)
