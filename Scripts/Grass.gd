extends Area2D




func _on_body_entered(body):
	if randi_range(0, 25) == 10:
		get_parent().encounter()
