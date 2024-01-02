extends CharacterBody2D


const SPEED = 2.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _enter_tree():
	set_multiplayer_authority(name.to_int())
	$Camera2D.enabled = is_multiplayer_authority()
	$Label.text = name



func _physics_process(delta):
	if is_multiplayer_authority():
		if Input.is_action_pressed('ui_right'):
			position.x += SPEED
		if Input.is_action_pressed('ui_left'):
			position.x -= SPEED
		if Input.is_action_pressed('ui_down'):
			position.y += SPEED
		if Input.is_action_pressed('ui_up'):
			position.y -= SPEED
		
