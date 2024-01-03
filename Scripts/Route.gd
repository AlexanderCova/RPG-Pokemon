extends Node2D


@export var route_num : int = 102


func encounter():
	var encounters = Global.encounters[str(route_num)]
	
	Global.encounter(encounters[randi_range(1, 4) - 1])
