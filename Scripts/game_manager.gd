extends Node2D

var peer = ENetMultiplayerPeer.new()
@export var player_scene : PackedScene
@onready var camera = $Camera2D
@onready var start_screen = $"Start Screen"
@onready var ui = $Ui
@onready var spawn_point = $"Spawn Point"
@onready var ip_edit = $"Start Screen/VBoxContainer/IpEdit"
@onready var port_edit = $"Start Screen/VBoxContainer/PortEdit"


func _on_host_button_pressed():
	Global.username = $"Start Screen/VBoxContainer/UsernameEdit".text
	peer.create_server(135)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(add_player)
	add_player()
	camera.enabled = false
	start_screen.hide()
	ui.show()
	
func _on_join_button_pressed():
	Global.username = $"Start Screen/VBoxContainer/UsernameEdit".text
	peer.create_client(ip_edit.text, port_edit.text.to_int())
	multiplayer.multiplayer_peer = peer
	camera.enabled = false
	ui.show()
	start_screen.hide()
	
	
func exit_game(id):
	multiplayer.peer_disconnected.connect(del_player, id)
	del_player(id)
	start_screen.show()
	camera.enabled = true

func add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id)
	player.position = spawn_point.position
	call_deferred("add_child",player)
	

func del_player(id):
	rpc("_del_player", id)
	

@rpc("any_peer", "call_local") func _del_player(id):
	get_node(str(id)).queue_free()
