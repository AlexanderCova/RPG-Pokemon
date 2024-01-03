extends Control

func setup():
	var pokemon = Global.team[Global.selected_part_pokemon]
	var stats = pokemon["stats"]
	
	$HP.text = str(stats["HP"])
	$Atk.text = str(stats["Attack"])
	$Def.text = str(stats["Defense"])
	$SpAtk.text = str(stats["Sp. Attack"])
	$SpDef.text = str(stats["Sp. Defense"])
	$Spd.text = str(stats["Speed"])
