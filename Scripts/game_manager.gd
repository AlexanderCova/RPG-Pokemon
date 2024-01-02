extends Node2D

var peer = ENetMultiplayerPeer.new()
@export var player_scene : PackedScene
@onready var camera = $Camera2D
@onready var start_screen = $"Start Screen"



func _on_host_button_pressed():
	peer.create_server(135)
	peer.set_bind_ip("127.0.0.1")
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(add_player)
	add_player()
	camera.enabled = false
	start_screen.hide()
	
func _on_join_button_pressed():
	peer.create_client("127.0.0.1", 135)
	multiplayer.multiplayer_peer = peer
	camera.enabled = false
	start_screen.hide()
	print("joined")
	
func exit_game(id):
	multiplayer.peer_disconnected.connect(del_player, id)
	del_player(id)
	start_screen.show()
	camera.enabled = true

func add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id)
	call_deferred("add_child",player)
	print("added player " + str(id))

func del_player(id):
	rpc("_del_player", id)
	

@rpc("any_peer", "call_local") func _del_player(id):
	get_node(str(id)).queue_free()
