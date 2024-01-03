extends Control

var is_open = false

func _on_party_button_pressed():
	hide()
	get_parent().get_node("PartyMenu").show()

func _process(delta):
	if Input.is_action_just_pressed("start"):
		if is_open == false:
			show()
			is_open = true
		else:
			hide()
			is_open = false
