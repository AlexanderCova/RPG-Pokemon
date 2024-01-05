extends Node2D


@export var route_num : int = 102


func encounter(body):
	var encounters = Global.encounters[str(route_num)]
	get_tree().current_scene.get_node("Ui/BattleScene").encounter(encounters[randi_range(1, 4) - 1])
