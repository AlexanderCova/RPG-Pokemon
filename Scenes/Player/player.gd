extends CharacterBody2D


const SPEED = 200
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
@onready var anim = $AnimationPlayer
var direction = "down"
var action = "idle"


func _enter_tree():
	set_multiplayer_authority(name.to_int())
	$Camera2D.enabled = is_multiplayer_authority()
	$Label.text = name
	print(position)



func _physics_process(delta):
	if is_multiplayer_authority():
		if Input.is_action_just_pressed("ui_cancel"):
			get_tree().current_scene.exit_game(name.to_int())
		
		velocity = Vector2.ZERO
		if Input.is_action_pressed('ui_right'):
			velocity.x += SPEED
			direction = "right"
		elif Input.is_action_pressed('ui_left'):
			velocity.x -= SPEED
			direction = "left"
		elif Input.is_action_pressed('ui_down'):
			velocity.y += SPEED
			direction = "down"
		elif Input.is_action_pressed('ui_up'):
			velocity.y -= SPEED
			direction = "up"
		
		if velocity != Vector2.ZERO:
			action = "walk"
			
			velocity = velocity.normalized() * SPEED
			move_and_slide()
		else:
			action = "idle"
		
		anim.play(action + direction)
